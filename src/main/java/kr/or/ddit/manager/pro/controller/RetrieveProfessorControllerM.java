package kr.or.ddit.manager.pro.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
@RequestMapping("manager/pro/")
public class RetrieveProfessorControllerM {

	@GetMapping("professorList")
	public String list() {
		return "tiles:manager/pro/professorList";
	}
	
	@GetMapping("professorDetails")
	public String details() {
		return "manager/pro/professorDetails";
	}
}
