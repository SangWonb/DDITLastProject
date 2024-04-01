package kr.or.ddit.student.careerup.employment.employmentagency.controller;

import java.util.List;
import java.util.Map;

import javax.inject.Inject;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import kr.or.ddit.student.careerup.employment.employmentagency.service.EmploymentAgencyServiceS;
import kr.or.ddit.utils.paging.BootstrapFormBasePaginationRenderer;
import kr.or.ddit.utils.paging.PaginationInfo;
import kr.or.ddit.utils.paging.PaginationRenderer;
import kr.or.ddit.vo.careerup.EmploymentPlaceVO;
import lombok.extern.slf4j.Slf4j;

@Slf4j
@Controller
@RequestMapping("/student/careerup/employment/employmentagency/employmentAgencyList")
public class EmploymentAgencyListControllerS {
	
	@Inject
	EmploymentAgencyServiceS service;

	@GetMapping
	public String list(			
			@RequestParam Map<String, Object> detailCondition
			, @RequestParam(name="page", required = false, defaultValue = "1") int currentPage
			, Model model	
		){
			PaginationInfo paging = new PaginationInfo(10,3);
			
			paging.setCurrentPage(currentPage);
			paging.setDetailCondition(detailCondition);
			
			List<EmploymentPlaceVO> employmentAgencyList = service.retrieveEmploymentAgencyList(paging);
			
			PaginationRenderer renderer = new BootstrapFormBasePaginationRenderer("#submitForm");

			String pagingHTML = renderer.renderPagination(paging);
			
			model.addAttribute("employmentAgencyList", employmentAgencyList);
			model.addAttribute("pagingHTML", pagingHTML);
			model.addAttribute("condition", detailCondition);
			model.addAttribute("contentTitle", "취업처");
		return "tiles:student/careerup/employment/employmentagency/employmentAgencyList";
	}
}
