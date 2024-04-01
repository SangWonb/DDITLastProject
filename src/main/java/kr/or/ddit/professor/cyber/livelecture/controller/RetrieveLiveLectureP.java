package kr.or.ddit.professor.cyber.livelecture.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
@RequestMapping("professor/cyber/livelecture")
public class RetrieveLiveLectureP {

	@GetMapping("/liveLectureList")
	public String list() {
		return "professor/cyber/livelecture/liveLectureList";
	}
	
	@GetMapping("/liveLectureDetails")
	public String details() {
		return "professor/cyber/livelecture/liveLectureDetails";
	}
}
