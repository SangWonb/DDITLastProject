package kr.or.ddit.professor.info.academicchange.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
@RequestMapping("professor/info/academicChange/")
public class RetrieveStudentAcademicChangeControllerS {

	@GetMapping("List")
	public String list() {
		return "professor/info/academicchange/academicChangeList";
	}
}
