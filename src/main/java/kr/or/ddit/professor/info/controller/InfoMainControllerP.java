package kr.or.ddit.professor.info.controller;


import java.util.List;

import javax.inject.Inject;
import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import kr.or.ddit.student.info.service.InfoMainService;
import kr.or.ddit.utils.annotation.RealUser;
import kr.or.ddit.vo.common.CalendarVO;
import kr.or.ddit.vo.user.MemberVO;

@Controller
@RequestMapping("professor/info/infoMain")
public class InfoMainControllerP {

	@Inject
	private InfoMainService service;
	
	@GetMapping
	public String main(@RealUser MemberVO mem, Model model, HttpSession session) {
		
	     List<CalendarVO> aList= service.retrieveAList();
	    	
	    model.addAttribute("aList", aList);
		
		return "tiles:professor/info/infoMain";
	}
	
    @GetMapping("getInfo")
    public String main( Model model) {
    	
    	List<CalendarVO> aList= service.retrieveAList();
    	
    	model.addAttribute("aList", aList);
    	
    	return "jsonView";
    }
}
