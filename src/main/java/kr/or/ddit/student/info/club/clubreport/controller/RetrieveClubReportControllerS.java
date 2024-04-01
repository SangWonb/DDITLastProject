package kr.or.ddit.student.info.club.clubreport.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
@RequestMapping("student/info/club/")
public class RetrieveClubReportControllerS {
	
	@GetMapping("clubreport")
	public String list() {
		return "tiles:student/info/club/clubreport/clubReportList";
	}
	
	@GetMapping("clubreport/{reportNo}")
	public String details(@PathVariable String reportNo) {
		return "tiles:student/info/club/clubreport/clubReportDetails";
	}
	
	

}
