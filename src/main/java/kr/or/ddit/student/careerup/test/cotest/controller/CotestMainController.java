package kr.or.ddit.student.careerup.test.cotest.controller;

import java.util.List;

import javax.inject.Inject;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;

import kr.or.ddit.enumpkg.ServiceResult;
import kr.or.ddit.student.careerup.test.cotest.service.CotestService;
import kr.or.ddit.utils.annotation.RealUser;
import kr.or.ddit.vo.careerup.CotestQuestionVO;
import kr.or.ddit.vo.careerup.CotestResultVO;
import kr.or.ddit.vo.careerup.CotestTextVO;
import kr.or.ddit.vo.user.MemberVO;

@RequestMapping("/student/careerup/test/cotest")
@Controller
public class CotestMainController {
	
	@Inject
	private CotestService service;
	
	@GetMapping
	public String cotestMain () {
		return "tiles:student/careerup/test/cotest/cotestMain";
	}
	
	@GetMapping("/takeAtest")
	public String takeAtest(
			Model model
			) {
		List<CotestQuestionVO> qList=service.retrieveQ();
		List<CotestTextVO> tList= service.retrieveT();
	
		model.addAttribute("total", qList.size());
		model.addAttribute("qList", qList);
		model.addAttribute("tList", tList);
		
		
		return "tiles:student/careerup/test/cotest/takeAtest";
	}
	
	
	@GetMapping("/cotestResult")
	public String cotestResult(
			@RealUser MemberVO mem,
			Model model
			) {
		String memNo = mem.getMemNo();
		
		List<CotestResultVO> resultList = service.retrieveResultList(memNo);
		
		model.addAttribute("resultList",resultList);
		
		return "tiles:student/careerup/test/cotest/cotestResult";
	}
	
	@GetMapping("/getInfo")
	public String getInfoList(
			@RealUser MemberVO mem,
			Model model
			) {
		String memNo = mem.getMemNo();
		String deptCode = mem.getDeptCode();
		
		List<CotestQuestionVO> cate = service.retrieveCate();
		CotestResultVO  avg=service.retrieveAvg();
		CotestResultVO  myAvg=service.retrieveMyAvg(memNo);
		CotestResultVO deptAvg=service.retrieveDeptAvg(deptCode);
		List<CotestResultVO> resultList = service.retrieveResultList(memNo);
		
		
		model.addAttribute("avg",avg);
	    model.addAttribute("deptAvg",deptAvg);
	    model.addAttribute("myAvg",myAvg);
	    model.addAttribute("cate",cate);
	    model.addAttribute("resultList",resultList);
		
		return "jsonView";
	}
	
	@PostMapping("/addResult")
	public String addResult(
			@RequestBody CotestResultVO newResult,
			Model model,
			@RealUser MemberVO mem
			) {
		String memNo=mem.getMemNo();
		newResult.setMemNo(memNo);
		
		ServiceResult result=service.addResult(newResult);

		model.addAttribute("result", result);
		
		return "jsonView";
	}
}
