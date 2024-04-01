package kr.or.ddit.professor.info.club.clubcreate.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
@RequestMapping("professor/info/club/clubcreate/")
public class RetrieveClubCreateControllerP {

	@GetMapping("clubCreateList")
	public String list() {
		return "professor/info/club/clubcreate/clubCreateList";
	}
}
