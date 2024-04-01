package kr.or.ddit.manager.stats.scholarship.controller;

import javax.inject.Inject;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import kr.or.ddit.manager.stats.scholarship.dao.ScholarShipStatisticsDAOM;

@Controller
@RequestMapping("manager/state/scholarship")
public class RetrieveScholarShipStatisticsControllerM {
	
	@Inject
	ScholarShipStatisticsDAOM dao;
	
	@GetMapping
	public String list(Model model) {
		model.addAttribute("deptCount", dao.selectDeptList());
		model.addAttribute("scCount", dao.selectScList());
		model.addAttribute("contentTitle","장학 통계");
		return "tiles:manager/state/scholarship/list";
	}
}
