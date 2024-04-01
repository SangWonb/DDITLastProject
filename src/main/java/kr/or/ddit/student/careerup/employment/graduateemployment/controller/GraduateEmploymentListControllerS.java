package kr.or.ddit.student.careerup.employment.graduateemployment.controller;

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

import kr.or.ddit.student.careerup.employment.graduateemployment.dao.GraduateEmploymentChartDAOS;
import kr.or.ddit.student.careerup.employment.graduateemployment.service.GraduateEmploymentServiceS;
import kr.or.ddit.utils.paging.BootstrapFormBasePaginationRenderer;
import kr.or.ddit.utils.paging.PaginationInfo;
import kr.or.ddit.utils.paging.PaginationRenderer;
import kr.or.ddit.vo.careerup.SeniorCoworkerVO;
import lombok.extern.slf4j.Slf4j;

@Slf4j
@Controller
@RequestMapping("/student/careerup/employment/graduateemployment")
public class GraduateEmploymentListControllerS {

	@Inject
	GraduateEmploymentServiceS service;
	
	@Inject
	GraduateEmploymentChartDAOS dao;
	
	@GetMapping("graduateEmploymentList")
	public String mentorList(			
			@RequestParam Map<String, Object> detailCondition
			, @RequestParam(name="page", required = false, defaultValue = "1") int currentPage
			, Model model	
			, @ModelAttribute("paging") PaginationInfo page
	){
		PaginationInfo paging = new PaginationInfo(10,3);
		
		paging.setCurrentPage(currentPage);
		paging.setDetailCondition(detailCondition);
		paging.setSimpleCondition(page.getSimpleCondition());
		log.info("\n\n\n\n{}\n\n\n\n",page.getSimpleCondition());
		List<SeniorCoworkerVO> graduateEmploymentList = service.retrieveGraduateEmploymentList(paging);
		PaginationRenderer renderer = new BootstrapFormBasePaginationRenderer("#submitForm");

		String pagingHTML = renderer.renderPagination(paging);
		
		model.addAttribute("graduateEmploymentList", graduateEmploymentList);
		model.addAttribute("pagingHTML", pagingHTML);
		model.addAttribute("condition", detailCondition);
		model.addAttribute("contentTitle", "선배 취업처 목록");

		return "tiles:student/careerup/employment/graduateemployment/graduateEmploymentList";
	}
	@GetMapping("chart")
	public String chart(Model model){
		List<SeniorCoworkerVO> companyType = dao.companyType();
		List<SeniorCoworkerVO> companyLoc = dao.companyLoc();
		List<SeniorCoworkerVO> companyJob = dao.companyJob();
		model.addAttribute("companyType", companyType);
		model.addAttribute("companyLoc", companyLoc);
		model.addAttribute("companyJob", companyJob);

		return "jsonView";
	}
	
	@GetMapping("graduateEmploymentDetail/{srNo}")
	public String mentorOne(@PathVariable String srNo, Model model) {
		SeniorCoworkerVO graduateEmployment = service.retrieveGraduateEmployment(srNo);
		log.info("\n\n\n\n\n\n{}\n\n\n\n\n",graduateEmployment);
		model.addAttribute("graduateEmployment", graduateEmployment);
		return "student/careerup/employment/graduateemployment/graduateEmploymentDetail";
	}
}
