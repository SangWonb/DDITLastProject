package kr.or.ddit.professor.cyber.syllabus.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
@RequestMapping("/professor/cyber/syllabus/syllabusView")
public class SyllabusViewControllerP {

	@GetMapping
	public String view() {
		return "professor/cyber/syllabus/syllabusView";
	}
}
