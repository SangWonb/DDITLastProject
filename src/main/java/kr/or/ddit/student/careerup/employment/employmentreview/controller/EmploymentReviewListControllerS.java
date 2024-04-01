package kr.or.ddit.student.careerup.employment.employmentreview.controller;

import java.util.List;
import java.util.Map;

import javax.inject.Inject;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import kr.or.ddit.student.careerup.employment.employmentreview.service.EmploymentReviewServiceS;
import kr.or.ddit.utils.paging.BootstrapFormBasePaginationRenderer;
import kr.or.ddit.utils.paging.PaginationInfo;
import kr.or.ddit.utils.paging.PaginationRenderer;
import kr.or.ddit.vo.careerup.EmploymentReviewVO;

@Controller
@RequestMapping("/student/careerup/employment/employmentreview")
public class EmploymentReviewListControllerS {
	
	@Inject
	EmploymentReviewServiceS service;

	@GetMapping("employmentReviewList")
	public String list(			
			@RequestParam Map<String, Object> detailCondition
			, @RequestParam(name="page", required = false, defaultValue = "1") int currentPage
			, Model model	
			, @ModelAttribute("paging") PaginationInfo page
		){
			PaginationInfo paging = new PaginationInfo(5,5);
			
			paging.setCurrentPage(currentPage);
			paging.setDetailCondition(detailCondition);
			paging.setSimpleCondition(page.getSimpleCondition());
			
			List<EmploymentReviewVO> employmentReviewList = service.retrieveEmployReviewList(paging);
			
			PaginationRenderer renderer = new BootstrapFormBasePaginationRenderer("#submitForm");

			String pagingHTML = renderer.renderPagination(paging);
			
			model.addAttribute("employmentReviewList", employmentReviewList);
			model.addAttribute("pagingHTML", pagingHTML);
			model.addAttribute("condition", detailCondition);
			model.addAttribute("contentTitle", "취업 후기");
		
		return "tiles:student/careerup/employment/employmentreview/employmentReviewList";
	}
	
	@GetMapping("employmentReviewDetail/{empNo}")
	public String detail(@PathVariable String empNo, Model model) {
		EmploymentReviewVO employmentReview = service.retrieveEmployReview(empNo);
		model.addAttribute("employmentReview", employmentReview);
		return "student/careerup/employment/employmentreview/employmentReviewDetail";
	}
}
