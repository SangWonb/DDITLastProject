package kr.or.ddit.professor.cyber.teamproject.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
@RequestMapping("professor/cyber/{lecCode}/teamProjectInsert")
public class TeamProjectInsertControllerP {
	
	@GetMapping
	public String teamProjectInsert(@PathVariable String lecCode) {
		return "professor/cyber/teamproject/teamProjectForm";
	}

}
