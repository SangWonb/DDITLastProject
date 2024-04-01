package kr.or.ddit.manager.stats.enrolledstudent.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
@RequestMapping("manager/state/enrolledStudentState")
public class EnrolledStudentStateControllerM {
	
	@GetMapping
	public String EnrolledStudentState() {
		return "tiles:manager/state/enrolledstudent/enrolledStudentState";
	}

}
