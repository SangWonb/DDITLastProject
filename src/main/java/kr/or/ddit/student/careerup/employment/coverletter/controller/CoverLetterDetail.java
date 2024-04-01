package kr.or.ddit.student.careerup.employment.coverletter.controller;

import java.util.List;
import java.util.Set;

import javax.inject.Inject;

import org.springframework.http.MediaType;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.validation.annotation.Validated;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import kr.or.ddit.enumpkg.ServiceResult;
import kr.or.ddit.student.careerup.employment.coverletter.service.CoverLetterDetailService;
import kr.or.ddit.utils.annotation.RealUser;
import kr.or.ddit.utils.paging.BootstrapFormBasePaginationRenderer;
import kr.or.ddit.utils.paging.PaginationInfo;
import kr.or.ddit.utils.paging.PaginationRenderer;
import kr.or.ddit.validate.InsertGroup;
import kr.or.ddit.validate.UpdateGroup;
import kr.or.ddit.vo.careerup.CoverLetterDetailVO;
import kr.or.ddit.vo.careerup.CoverLetterVO;
import kr.or.ddit.vo.common.BookVO;
import kr.or.ddit.vo.user.MemberVO;
import kr.or.ddit.vo.user.StudentVO;
import lombok.extern.slf4j.Slf4j;

@Slf4j
@Controller
@RequestMapping("/student/careerup/employment/coverletter/")
public class CoverLetterDetail {
	
	@Inject
	private CoverLetterDetailService service;
	
	@GetMapping("coverLetterDetailList")
	public String CoverLetter(Model model) {
		model.addAttribute("contentTitle", "자기소개서");
		return "tiles:student/careerup/employment/coverletter/coverLetterDetailList";
	}
	
	@GetMapping(value = "jsoncoverList", produces = MediaType.APPLICATION_JSON_VALUE)
	@ResponseBody
	public Model CoverLetterList(
		@RequestParam(name="page", required = false, defaultValue = "1") int currentPage	
		, Model model
		, @RealUser StudentVO mem
	) {
        PaginationInfo paging = new PaginationInfo(5,3);
        paging.setCurrentPage(currentPage);
        log.info("paging : {}", paging);                   
        log.info("currentPage : {}", currentPage);  
        
		String smemNo = mem.getSmemNo();
		
		List<CoverLetterVO> coverList = service.selectList(smemNo);
		log.info("coverList : {}", coverList);  
		
		PaginationRenderer renderer = new BootstrapFormBasePaginationRenderer("#searchForm");
		String pagingHTML = renderer.renderPagination(paging);
		
		model.addAttribute("coverList", coverList);
        model.addAttribute("pagingHTML", pagingHTML);
		return model;
	}
	
	@PostMapping("/coverLetterDetailList")
	public String insertCover(
	    @Validated(value = {InsertGroup.class})   
	    @RequestBody CoverLetterDetailVO[] formDataArray
	    , BindingResult errors
	    , Model model
	    , @RealUser StudentVO stu
	) {
		String logicalViewName = null;
		ServiceResult result = service.insertCoverResult(formDataArray, stu);

		if (result == ServiceResult.OK) {
			logicalViewName = "redirect:/student/careerup/employment/coverletter/coverLetterDetailList";
		} else {
			logicalViewName = "redirect:/student/careerup/employment/coverletter/coverLetterDetailList";
		}
		return logicalViewName;
	}
	
	@GetMapping("coverView/{clNo}")
	public String CoverDetail(@PathVariable String clNo, Model model) {
	    List<CoverLetterDetailVO> coverList = service.selectDetail(clNo); // 같은 clNo에 해당하는 자기소개서 목록 조회
	    
	    log.info("coverList: {}", coverList); // 로그에 coverList를 출력하도록 수정
	    
	    model.addAttribute("coverList", coverList);
	    
	    return "student/careerup/employment/coverletter/coverView";
	}

	@GetMapping("coverViewPrint/{clNo}") // 인쇄하기 버튼 클릭 시 새 창으로 열기 위한 컨트롤러
	public String CoverDetailPrint(@PathVariable String clNo, Model model) {
	    List<CoverLetterDetailVO> coverList = service.selectDetail(clNo); // 같은 clNo에 해당하는 자기소개서 목록 조회
	    
	    log.info("coverList for printing: {}", coverList); // 인쇄를 위한 coverList를 로그에 출력
	    
	    model.addAttribute("coverList", coverList);
	    
	    return "student/careerup/employment/coverletter/coverViewPrint";
	}
	
	@PostMapping("deleteCover")
	public String deleteCover(@RequestParam String clNo) {
		CoverLetterDetailVO delData = new CoverLetterDetailVO();
	    log.info("clNo : {}", clNo);

	    ServiceResult coverLetterResult = service.deleteCoverLetter(clNo);
	    ServiceResult coverResult = service.deleteCover(clNo);

	    String logicalViewName = "redirect:/student/careerup/employment/coverletter/coverLetterDetailList";

	    if (coverLetterResult != ServiceResult.OK || coverResult != ServiceResult.OK) {
	        logicalViewName = "redirect:/errorPage";
	    }

	    return logicalViewName;
	}
	
	@PostMapping("updateCover")
    public String updateCover(
    	@Validated(UpdateGroup.class) @RequestBody CoverLetterDetailVO cldNo
    	, BindingResult errors
    	, Model model
    	, RedirectAttributes redirectAttributes
    ){
    	String logicalViewName = null;
    	if(!errors.hasErrors()) {
    		ServiceResult result = service.updateCoverLetter(cldNo);
    		switch (result) {
    		case OK:
    			logicalViewName = "redirect:/student/careerup/employment/coverletter/coverLetterDetailList";
                break;
            case FAIL:
            	logicalViewName = "redirect:/student/careerup/employment/coverletter/coverLetterDetailList";
                break;
            default:
                break;
    			
    		}
    	}
    	return logicalViewName;
    }
	
}
