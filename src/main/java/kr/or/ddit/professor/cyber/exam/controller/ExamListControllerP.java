package kr.or.ddit.professor.cyber.exam.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
@RequestMapping("/professor/cyber/exam/examList")
public class ExamListControllerP {

	@GetMapping
	public String list() {
		
		return "professor/cyber/exam/examList";
	}
}
