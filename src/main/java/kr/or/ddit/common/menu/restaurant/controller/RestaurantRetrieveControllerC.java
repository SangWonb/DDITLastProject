package kr.or.ddit.common.menu.restaurant.controller;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.inject.Inject;

import org.springframework.http.MediaType;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.validation.FieldError;
import org.springframework.validation.ObjectError;
import org.springframework.validation.annotation.Validated;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.RestController;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import kr.or.ddit.common.menu.restaurant.service.RestaurantService;
import kr.or.ddit.enumpkg.ServiceResult;
import kr.or.ddit.utils.annotation.RealUser;
import kr.or.ddit.utils.paging.BootstrapFormBasePaginationRenderer;
import kr.or.ddit.utils.paging.PaginationInfo;
import kr.or.ddit.utils.paging.PaginationRenderer;
import kr.or.ddit.utils.paging.TamplateFormBasePagingationRenderer;
import kr.or.ddit.validate.InsertGroup;
import kr.or.ddit.vo.common.RestaurantRecomVO;
import kr.or.ddit.vo.common.RestaurantReviewVO;
import kr.or.ddit.vo.common.RestaurantVO;
import kr.or.ddit.vo.user.MemberVO;
import kr.or.ddit.vo.user.StudentVO;
import lombok.extern.slf4j.Slf4j;

@Slf4j
@Controller
@RequestMapping("common/menu/restaurant")
public class RestaurantRetrieveControllerC {
	
	@Inject
	private RestaurantService service;

	@ModelAttribute("res")
	public RestaurantVO res() {
		return new RestaurantVO();
	}
	
	@GetMapping
	public String restaurantListUI(Model model) {
		model.addAttribute("contentTitle", "식당");
		return "tiles:common/menu/restaurant/restaurantList";
	}
	
	@PostMapping(produces = "application/json") // 모달 띄운채로 비동기 요청함 + 신청서 등록이라 식당에 추가되는 것 없음 >> redirect 안함
	@ResponseBody
	public Model restaurantAppl(
		@Validated(InsertGroup.class) @ModelAttribute("res") RestaurantVO res
		,BindingResult errors
		,Model model
	) {
		if(!errors.hasErrors()) {
			ServiceResult result = service.createRestaurant(res);
			String message = null;
			switch (result) {
			case OK:
				model.addAttribute("success", true);
				break;
			default:
				model.addAttribute("success", false);
				break;
			}
		}else {
			List<Map<String, String>> errMsg = new ArrayList<Map<String,String>>();
			List<ObjectError> allErrors = errors.getAllErrors();
			for(ObjectError err:allErrors) {
				if(err instanceof FieldError) {
		            FieldError fieldError = (FieldError) err;
		            Map<String, String> errM = new HashMap<String, String>();
		            errM.put(fieldError.getField(), err.getDefaultMessage());
		            errMsg.add(errM);
		        }
			}
			log.info("\n\n\n\n\n\n{}\n\n\n\n\n\n",errMsg);
			model.addAttribute("success", false);
			model.addAttribute("errMsg", errMsg);
		}
		return model;
	}
	
	//페이징 처리
	@GetMapping(produces = MediaType.APPLICATION_JSON_VALUE)
	public void restaurantListData(
		@RequestParam Map<String,Object> detailCondition
		, @RequestParam(name="page", required = false, defaultValue = "1") int currentPage // 기본값을 설정하지 않아도 된다면 옵셔널로 해도됨
		, Model model
	) {
		
		PaginationInfo paging = new PaginationInfo(7,3);
		paging.setCurrentPage(currentPage);
		paging.setDetailCondition(detailCondition);
		
		log.info("\n\n\n{}\n\n\n",detailCondition);
	
		List<RestaurantVO> resList = service.retrieveRestaurantList(paging);
		
		PaginationRenderer renderer = new TamplateFormBasePagingationRenderer("#searchForm");
		String pagingHTML = renderer.renderPagination(paging);
		
		model.addAttribute("resList", resList);
		model.addAttribute("pagingHTML", pagingHTML);
		
	}
	
	@GetMapping(value = "{resAppno}" )
	public String restaurantHTML(Model model, @PathVariable String resAppno) {
		
		RestaurantVO res = service.retrieveRestaurant(resAppno);
		model.addAttribute("res", res);
			
		return "common/menu/restaurant/restaurantView";			
	}
	
	@GetMapping(value = "{resAppno}/data" )
	public String restaurantData(Model model, @PathVariable String resAppno) {
		
		RestaurantVO res = service.retrieveRestaurant(resAppno);
		model.addAttribute("res", res);
			
		return "jsonView";			
	}
	
	@GetMapping(value = "{resAppno}/review" )
	public String restaurantRVData(Model model, @PathVariable String resAppno) {
		
		RestaurantVO res = service.retrieveRestaurant(resAppno);
		model.addAttribute("res", res);
			
		return "common/menu/restaurant/restaurantReview";			
	}
	
	@PostMapping(value = "{resAppno}/review", consumes = MediaType.APPLICATION_JSON_VALUE)
	public String restaurantReviewWrite(
			Model model, @PathVariable String resAppno, 
			@RequestBody RestaurantReviewVO rv,
			@RealUser MemberVO mem,
			RedirectAttributes redirect) {
		if(mem instanceof StudentVO) {
			StudentVO stu =  (StudentVO) mem;
		}
		
		
		rv.setResAppno(resAppno);
		rv.setMemNo(mem.getMemNo());
		
		ServiceResult result = service.createRestaurantReview(rv);
		
		String logicalViewName = "";
		switch (result) {
		case OK:
			redirect.addFlashAttribute("success", true);
			redirect.addFlashAttribute("message", "리뷰가 등록되었습니다.");
			break;
		default:
			redirect.addFlashAttribute("success", false);
			redirect.addFlashAttribute("message", "서버의 문제로 등록에 실패하였습니다.");
			break;
		}
		
		
		return "redirect:/common/menu/restaurant/"+ resAppno +"/review";
	}
	
	@PostMapping(value = "recome", consumes = MediaType.APPLICATION_JSON_VALUE)
	@ResponseBody
	public RestaurantRecomVO restaurantRecom(
		@RequestParam String resCode,
		@RealUser MemberVO mem
	) {
		
		RestaurantRecomVO resRecom = new RestaurantRecomVO();
		resRecom.setResGroup(resCode);
		
		RestaurantRecomVO recom = service.restaurantRecom(resRecom);
		
		return recom;
	}
	
	//모달 html 반환
	@GetMapping("recomModal")
	public String restaurantRecomModal() {
		
		return "common/menu/restaurant/restaurantRecomModal";
	}
	@GetMapping("applModal")
	public String restaurantApplModal() {
		
		return "common/menu/restaurant/restaurantApplModal";
	}
	
	
	

}
