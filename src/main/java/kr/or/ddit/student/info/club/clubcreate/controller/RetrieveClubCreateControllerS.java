package kr.or.ddit.student.info.club.clubcreate.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
@RequestMapping("student/info/club/")
public class RetrieveClubCreateControllerS {

	@GetMapping("clubCreateList")
	public String list() {
		return "tiles:student/info/club/clubcreate/clubCreateList";
	}
}
