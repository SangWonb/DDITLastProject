package kr.or.ddit.professor.cyber.lecturematerial.controller;

import java.util.List;
import java.util.Map;

import javax.inject.Inject;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.validation.annotation.Validated;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import kr.or.ddit.enumpkg.ServiceResult;
import kr.or.ddit.professor.cyber.lecturematerial.service.LectureDataServiceP;
import kr.or.ddit.utils.annotation.RealUser;
import kr.or.ddit.utils.paging.BootstrapFormBasePaginationRenderer;
import kr.or.ddit.utils.paging.PaginationInfo;
import kr.or.ddit.utils.paging.PaginationRenderer;
import kr.or.ddit.validate.InsertGroup;
import kr.or.ddit.validate.UpdateGroup;
import kr.or.ddit.vo.cyber.LectureDataVO;
import kr.or.ddit.vo.user.MemberVO;
import lombok.extern.slf4j.Slf4j;

@Slf4j
@Controller
@RequestMapping("/professor/cyber")
public class LectureDataControllerP {
	
	@Inject
	LectureDataServiceP service;

	@GetMapping("{lecCode}/lectureDataList")
	public String list(@PathVariable String lecCode,
			@RequestParam Map<String, Object> detailCondition,
			@RequestParam(name="page", required = false, defaultValue = "1") int currentPage
			, @ModelAttribute("paging") PaginationInfo page
			, Model model
			) {
		PaginationInfo paging = new PaginationInfo(5,5);
		
		paging.setCurrentPage(currentPage);
		paging.setSimpleCondition(page.getSimpleCondition());
		paging.setDetailCondition(detailCondition);

		List<LectureDataVO> lectureDataList = service.retrieveLectureDataList(paging, lecCode);

		PaginationRenderer renderer = new BootstrapFormBasePaginationRenderer("#submitForm");
		String pagingHTML = renderer.renderPagination(paging);
		
		
		model.addAttribute("lectureDataList", lectureDataList);
		model.addAttribute("pagingHTML", pagingHTML);
		model.addAttribute("contentTitle", "강의자료실");
			
		return "tiles:professor/cyber/lecturedata/lectureDataList";
	}
	
	@GetMapping("lectureDataDetail")
	public String detail(@RequestParam String lecDatano, Model model) {
		LectureDataVO data = service.retrieveLectureData(lecDatano);
		model.addAttribute("data", data);
		return "tiles:professor/cyber/lecturedata/lectureDataDetail";
	}
	
	@GetMapping("{lecCode}/lectureDataInsertForm")
	public String insertForm(Model model, @PathVariable String lecCode, @RealUser MemberVO mem) {
		String memName = mem.getMemName();
		model.addAttribute("lecCode", lecCode);
		model.addAttribute("memName", memName);
	    return "tiles:professor/cyber/lecturedata/lectureDataInsertForm";
	}
	
	@PostMapping("lecturedata/lectureDataInsertForm")
	@ResponseBody
	public String insertProcess(
		@RealUser MemberVO mem,
	    @Validated(InsertGroup.class) 
	    @ModelAttribute LectureDataVO vo,
	    BindingResult errors,
	    Model model
	) {
		log.info("\n\n\n\n{}\n\n\n\n","sksksk");
		
		vo.setMemName(mem.getMemName());
		log.info("\n\n\n{}\n\n\n",vo.getLecDatacontent());
		String logicalViewName = null;
	    if (!errors.hasErrors()) {
	        ServiceResult result = service.createLectureData(vo);
	        String message = null;
	        switch (result) {
	            case OK:
	                logicalViewName = "redirect:/professor/cyber/"+vo.getLecCode()+"/lectureDataList";
	                break;
	            default:
	                logicalViewName = "professor/cyber/lecturedata/lectureDataInsertForm";
	                message = "다시 입력 바람";
	                break;
	        }
	        model.addAttribute("message", message);
	    } else {
	        logicalViewName = "professor/cyber/lecturedata/lectureDataInsertForm";
	    }
	    return logicalViewName;
	}
	
	// 업데이트 폼
	@GetMapping("lectureDataEditForm")
	public String editForm(@RequestParam String lecDatano, Model model) {
		LectureDataVO data = service.retrieveLectureData(lecDatano);
		model.addAttribute("data", data);
	    return "tiles:professor/cyber/lecturedata/lectureDataEditForm";
	}
	
	// 업데이트 처리
	@PostMapping("lectureDataEditForm")
	public String update(
	    @Validated(UpdateGroup.class) 
	    @ModelAttribute ("lectureDataVO") LectureDataVO vo,
	    BindingResult errors,
	    Model model
	) {
	    String logicalViewName = null;
	    if (!errors.hasErrors()) {
	        ServiceResult result = service.modifyLectureData(vo);
	        String message = null;
	        switch (result) {
	            case OK:
	                logicalViewName = "redirect:/professor/cyber/lecturedata/lectureDataList";
	                break;
	            default:
	                logicalViewName = "professor/cyber/lecturedata/lectureDataEditForm";
	                message = "다시 입력 바람";
	                break;
	        }
	        model.addAttribute("message", message);
	    } else {
	        logicalViewName = "professor/cyber/lecturedata/lectureDataEditForm";
	    }
	    return logicalViewName;
	}
	
	@PostMapping("del")
	public String delete(@RequestParam String lecDatano, Model model) {
		service.removeLectureData(lecDatano);
		return "redirect:/professor/cyber/lecturedata/lectureDataList";
	}
}
