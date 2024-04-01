package kr.or.ddit.student.careerup.test.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

@RequestMapping("/student/careerup/test")
@Controller
public class CareerTestMainController {

	@GetMapping
	public String careerTestMain() {
		return "tiles:student/careerup/test/testList";
	}
	
	@GetMapping("/votest")
	public String votestMain() {
		return "tiles:student/careerup/test/votest/votestMain";
	}
	
}
