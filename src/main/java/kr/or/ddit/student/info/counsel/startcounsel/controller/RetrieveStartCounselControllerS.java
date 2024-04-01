package kr.or.ddit.student.info.counsel.startcounsel.controller;

import java.util.List;

import javax.inject.Inject;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import kr.or.ddit.student.info.counsel.startcounsel.service.CounselSService;
import kr.or.ddit.utils.annotation.RealUser;
import kr.or.ddit.vo.info.CounselVO;
import kr.or.ddit.vo.user.MemberVO;

@Controller
@RequestMapping("student/info/counsel/")
public class RetrieveStartCounselControllerS {

	@Inject
	private CounselSService service;
	
	
	@GetMapping("liveCounselList")
	public String list(
			@RealUser MemberVO mem,
			Model model
			) {
		String memNo = mem.getMemNo();
		List<CounselVO> counselList = service.retrieveCounselList(memNo);
		
		int total =service.retrieveTotal(memNo);
		int waiting = service.retrieveWaiting(memNo);
		
		model.addAttribute("counselList", counselList);
		model.addAttribute("total", total);
		model.addAttribute("waiting", waiting);
		
		return "tiles:student/info/counsel/startcounsel/liveCounselList";
	}
	
	@GetMapping("liveCounselDetail")
	public String details(
			@RequestParam String counsNo
			, Model model
			) {
		CounselVO detail = service.retrieveCounsel(counsNo);
		
		model.addAttribute("detail", detail);
		
		return "jsonView";
	}
}
