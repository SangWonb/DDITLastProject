package kr.or.ddit.student.careerup.licenserecom.controller;

import java.util.List;
import java.util.Map;

import javax.inject.Inject;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.Errors;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import kr.or.ddit.student.careerup.licenserecom.dao.DeptAndSeniorDAO;
import kr.or.ddit.student.careerup.licenserecom.service.LicenseRecomServiceS;
import kr.or.ddit.vo.careerup.LicenseRecomVO;
import lombok.extern.slf4j.Slf4j;

@Slf4j
@Controller
@RequestMapping("/student/careerup/licenserecom")
public class LicenseRecomControllerS {
	
	@Inject
	LicenseRecomServiceS service;
	@Inject
	DeptAndSeniorDAO dao;
	
	@GetMapping("licenseRecom")
	public String licenseRecom(
			@RequestParam Map<String, Object> detailCondition
			, @ModelAttribute LicenseRecomVO licenseVO, Errors error
			, Model model	
		){
		
		    List<Map<String, Object>> deptList = dao.selectDeptList();
		    List<Map<String, Object>> seniorJobList = dao.selectSeniorJobList();
		    
			model.addAttribute("deptList", deptList);
			model.addAttribute("seniorJobList", seniorJobList);
			model.addAttribute("condition", detailCondition);
			model.addAttribute("contentTitle", "자격증 추천");
		return "tiles:student/careerup/licenserecom/licenseRecom";
	}
	
	@PostMapping("recom")
	public String submitLicenseRecom(
			@RequestParam("licenDept") String licenDept, 
            @RequestParam("licenJob") String licenJob,
			Model model
		){
		LicenseRecomVO recom = service.licenseRecom(licenDept,licenJob);
		    
		model.addAttribute("recom", recom);
		return "student/careerup/licenserecom/recom";
	}
}