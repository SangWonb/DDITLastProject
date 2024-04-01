package kr.or.ddit.professor.info.club.clublist.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
@RequestMapping("professor/info/club")
public class RetrieveClubControllerP {

	@GetMapping
	public String clubList() {
		return "professor/info/club/clubList";
	}
	
	@GetMapping("/{clubName}/clubReportList") 
	public String clubReportList(@PathVariable String clubName) {
		return "professor/info/club/clubreport/clubReportList";
	}
	
	@GetMapping("/{clubName}/clubReportList/{reportNo}")
	public String clubReportDetails(@PathVariable String clubName
									,@PathVariable String reportNo) {
		return "professor/info/club/clubreport/clubReportDetails";
	}

}
