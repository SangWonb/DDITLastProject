package kr.or.ddit.student.info.counsel.counseljournal.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
@RequestMapping("student/info/counsel/")
public class RetrieveCounselJournalControllerS {

	@GetMapping("counselJournalList")
	public String list() {
		return "tiles:student/info/counsel/counseljournal/counselJournalList";
		
	}
	
	@GetMapping("counselJournalList/{journalNo}")
	public String details(@PathVariable String journalNo) {
		return "tiles:student/info/counsel/counseljournal/counselJournalDetails";
	}
}
