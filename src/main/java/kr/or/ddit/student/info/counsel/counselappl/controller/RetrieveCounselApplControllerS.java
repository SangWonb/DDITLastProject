package kr.or.ddit.student.info.counsel.counselappl.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
@RequestMapping("student/info/counsel/")
public class RetrieveCounselApplControllerS {

	@GetMapping("counselApplList")
	public String list() {
		return "tiles:student/info/counsel/counselappl/counselApplList";
	}
}
