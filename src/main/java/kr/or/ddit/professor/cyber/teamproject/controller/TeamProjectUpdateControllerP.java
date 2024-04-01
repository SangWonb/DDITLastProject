package kr.or.ddit.professor.cyber.teamproject.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
@RequestMapping("professor/cyber/{lecCode}/teamProjectUpdate/{tpNo}")
public class TeamProjectUpdateControllerP {
	
	@GetMapping
	public String teamProjectUpdate(@PathVariable String lecCode,@PathVariable String tpNo) {
		return "professor/cyber/teamproject/teamProjectEdit";
	}

}
