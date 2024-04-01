package kr.or.ddit.manager.stu.period.signupclaseesperiod.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
@RequestMapping("/manager/stu/period/signupclaseesperiod/signUpClassesPreiodList")
public class SignUpClassesPreiodListControllerM {

	@GetMapping
	public String list() {
		
		return "tiles:manager/stu/period/signupclaseesperiod/signUpClassesPreiodList";
	}
}
