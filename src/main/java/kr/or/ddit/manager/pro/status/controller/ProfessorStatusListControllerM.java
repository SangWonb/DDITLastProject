package kr.or.ddit.manager.pro.status.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
@RequestMapping("manager/pro/status/professorStatusList")
public class ProfessorStatusListControllerM {

	@GetMapping
	public String list() {
		return "tiles:manager/pro/status/professorStatusList";
	}
}
