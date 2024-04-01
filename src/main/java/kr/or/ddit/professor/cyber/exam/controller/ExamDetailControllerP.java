package kr.or.ddit.professor.cyber.exam.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
@RequestMapping("/professor/cyber/exam/examDetail")
public class ExamDetailControllerP {
	@GetMapping
	public String detail() {
		
		return "professor/cyber/exam/examDetail";
	}
}
