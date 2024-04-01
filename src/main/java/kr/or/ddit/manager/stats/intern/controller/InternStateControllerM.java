package kr.or.ddit.manager.stats.intern.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
@RequestMapping("manager/state/internState")
public class InternStateControllerM {
	
	@GetMapping
	public String internState() {
		return "tiles:manager/state/intern/internState";
	}

}
