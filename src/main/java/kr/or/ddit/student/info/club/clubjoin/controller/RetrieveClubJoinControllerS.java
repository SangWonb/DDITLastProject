package kr.or.ddit.student.info.club.clubjoin.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
@RequestMapping("student/info/club/")
public class RetrieveClubJoinControllerS {
	
	@GetMapping("memberList")
	public String clubMemberList() {
		return "tiles:student/info/club/memberList";
	}
	
	@GetMapping("clubJoin")
	public String list() {
		return "tiles:student/info/club/clubjoin/clubJoinList";
	}
}
