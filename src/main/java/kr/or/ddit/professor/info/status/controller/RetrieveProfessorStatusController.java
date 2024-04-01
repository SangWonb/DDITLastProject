package kr.or.ddit.professor.info.status.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
@RequestMapping("professor/info/status/")
public class RetrieveProfessorStatusController {

	@GetMapping("professorStatusList")
	public String list() {
		return "professor/info/status/professorStatusList";
		
	}
	
	@GetMapping("professorStatusDetails")
	public String details() {
		return "professor/info/status/professorStatusDetails";
	}
}
