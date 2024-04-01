package kr.or.ddit.student.info.grade.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
@RequestMapping("student/info/grade/")
public class RetrieveGradeControllerS {

	@GetMapping("wholeGrade")
	public String wholeGrade() {
		return "tiles:student/info/grade/wholeGrade";
	}
	
	@GetMapping("currentGrade")
	public String currentGrade() {
		return "tiles:student/info/grade/currentGrade";
	}
}
