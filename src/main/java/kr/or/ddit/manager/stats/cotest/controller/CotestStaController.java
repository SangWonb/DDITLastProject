package kr.or.ddit.manager.stats.cotest.controller;

import java.util.List;

import javax.inject.Inject;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import kr.or.ddit.manager.stats.cotest.service.CotestStaService;
import kr.or.ddit.vo.careerup.CotestQuestionVO;
import kr.or.ddit.vo.careerup.CotestResultVO;

@RequestMapping("/manager/state/cotest")
@Controller
public class CotestStaController {
	
	@Inject
	private CotestStaService service;
	
	@GetMapping
	public String staMain(
			Model model
			) {
	
		List<CotestQuestionVO> cate = service.retrieveCate();
		CotestResultVO hruAvg= service.retrieveHruAvg();
		List<CotestResultVO> colAvg=service.retrieveColAvg();
		List<CotestResultVO> deptAvg=service.retrieveDeptAvg();
		
		
		model.addAttribute("hruAvg",hruAvg);
	    model.addAttribute("deptAvg",deptAvg);
	    model.addAttribute("colAvg",colAvg);
	    model.addAttribute("cate",cate);
		
		return "tiles:manager/state/cotest/cotestSta";
	}
	
	@GetMapping("/getInfo")
	public String getInfoList(
			Model model
			) {
		
		List<CotestQuestionVO> cate = service.retrieveCate();
		CotestResultVO hruAvg= service.retrieveHruAvg();
		List<CotestResultVO> colAvg=service.retrieveColAvg();
		List<CotestResultVO> deptAvg=service.retrieveDeptAvg();
		
		
		model.addAttribute("hruAvg",hruAvg);
	    model.addAttribute("deptAvg",deptAvg);
	    model.addAttribute("colAvg",colAvg);
	    model.addAttribute("cate",cate);
		
		return "jsonView";
	}
}
