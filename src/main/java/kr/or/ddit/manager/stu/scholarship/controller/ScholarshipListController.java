package kr.or.ddit.manager.stu.scholarship.controller;

import java.util.List;

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

import kr.or.ddit.enumpkg.ServiceResult;
import kr.or.ddit.manager.stu.scholarship.service.ScholarshipServiceM;
import kr.or.ddit.utils.paging.BootstrapFormBasePaginationRenderer;
import kr.or.ddit.utils.paging.PaginationInfo;
import kr.or.ddit.utils.paging.PaginationRenderer;
import kr.or.ddit.validate.InsertGroup;
import kr.or.ddit.validate.UpdateGroup;
import kr.or.ddit.vo.info.ScholashipVO;

/**
 * 메뉴 구조도 상에서는 학생의 장학이력을 같이 조회함
 */
@Controller
@RequestMapping("/manager/stu/scholarship")
public class ScholarshipListController {
	
	@Inject
	ScholarshipServiceM service;

	@GetMapping("scholarshipList")
	public String list(			
			@RequestParam(name="page", required = false, defaultValue = "1") int currentPage
			, @ModelAttribute("paging") PaginationInfo page
			, Model model	
		){
			PaginationInfo paging = new PaginationInfo(1,3);
			
			paging.setCurrentPage(currentPage);
			paging.setSimpleCondition(page.getSimpleCondition());
			
			List<ScholashipVO> scholarshipList = service.retrieveScholarshipNoticeList(paging);
			
			PaginationRenderer renderer = new BootstrapFormBasePaginationRenderer("#submitForm");

			String pagingHTML = renderer.renderPagination(paging);
			
			model.addAttribute("scholarshipList", scholarshipList);
			model.addAttribute("pagingHTML", pagingHTML);
			model.addAttribute("contentTitle", "장학금 관리");
		return "tiles:manager/stu/scholarship/scholarshipList";
	}
	
	@ModelAttribute("scholarship")
	public ScholashipVO scholarship() {
		return new ScholashipVO();
	}
	

	@GetMapping("scholarshipInsertForm")
	public String insertForm(Model model) {
	    return "manager/stu/scholarship/scholarshipInsertForm";
	}
	
	@PostMapping("scholarshipInsertForm")
	public String insertProcess(
	    @Validated(InsertGroup.class) 
	    @ModelAttribute ("vo") ScholashipVO vo,
	    BindingResult errors,
	    Model model
	) {
	    String logicalViewName = null;
	    if (!errors.hasErrors()) {
	        ServiceResult result = service.createScholarshipNotice(vo);
	        String message = null;
	        switch (result) {
	            case OK:
	                logicalViewName = "redirect:/manager/stu/scholarship/scholarshipList";
	                break;
	            default:
	                logicalViewName = "manager/stu/scholarship/scholarshipInsertForm";
	                message = "다시 입력 바람";
	                break;
	        }
	        model.addAttribute("message", message);
	    } else {
	        logicalViewName = "manager/stu/scholarship/scholarshipInsertForm";
	    }
	    return logicalViewName;
	}
	
	
	// 업데이트 폼
	@GetMapping("scholarshipEditForm/{scholCode}")
	public String editForm(@PathVariable String scholCode, Model model, @ModelAttribute("vo") ScholashipVO scholarship) {
		ScholashipVO vo = service.retrieveScholarshipNotice(scholCode);
		model.addAttribute("vo", vo);
	    return "manager/stu/scholarship/scholarshipEditForm";
	}
	
	// 업데이트 처리
	@PostMapping("scholarshipEditForm")
	public String update(
	    @Validated(UpdateGroup.class) 
	    @ModelAttribute ("vo") ScholashipVO vo,
	    BindingResult errors,
	    Model model
	) {
	    String logicalViewName = null;
	    if (!errors.hasErrors()) {
	        ServiceResult result = service.modifyScholarshipNotice(vo);
	        String message = null;
	        switch (result) {
	            case OK:
	                logicalViewName = "redirect:/manager/stu/scholarship/scholarshipList";
	                break;
	            default:
	                logicalViewName = "manager/stu/scholarship/scholarshipEditForm";
	                message = "다시 입력 바람";
	                break;
	        }
	        model.addAttribute("message", message);
	    } else {
	        logicalViewName = "manager/stu/scholarship/scholarshipEditForm";
	    }
	    return logicalViewName;
	}
	
	@PostMapping("del")
	public String delete(@RequestParam String scholCode, Model model) {
		service.removeScholarshipNotice(scholCode);
		return "redirect:/manager/stu/scholarship/scholarshipList";
	}
}
