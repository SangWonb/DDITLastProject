package kr.or.ddit.student.careerup.employment.resume.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
@RequestMapping("/student/careerup/employment/resume/")
public class ResumeControllerS {

	@GetMapping("resumeList")
	public String ResumeList() {
		return "tiles:student/careerup/employment/resume/resumeList";
	}
	
}
