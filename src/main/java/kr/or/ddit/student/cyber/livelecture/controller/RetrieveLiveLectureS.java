package kr.or.ddit.student.cyber.livelecture.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
@RequestMapping("student/cyber/livelecture/")
public class RetrieveLiveLectureS {

	@GetMapping("liveLectureList")
	public String list() {
		return "student/cyber/livelecture/liveLectureList";
	}
	
	@GetMapping("liveLectureDetails")
	public String details() {
		return "student/cyber/livelecture/liveLectureDetails";
	}
}
