package kr.or.ddit.professor.cyber.lecturenotice.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
@RequestMapping("professor/cyber/{lecCode}/lectureNoticeInsert")
public class LectureNoticeInsertControllerP {
	
	@GetMapping
	public String lectureNoticeInsertForm(@PathVariable String lecCode) {
		return "professor/cyber/lecturenotice/lectureNoticeForm";
	}

}
