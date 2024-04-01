package kr.or.ddit.student.careerup.employment.employmentdistribution.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
@RequestMapping("/student/careerup/employment/employmentdistribution/employmentDistributionView")
public class EmploymentDistributionViewControllerS {

	@GetMapping
	public String view() {
		return "tiles:student/careerup/employment/employmentdistribution/employmentDistributionView";
	}
}
