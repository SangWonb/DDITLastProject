package kr.or.ddit.professor.cyber.task.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
@RequestMapping("professor/cyber/{lecCode}/taskInsert")
public class TaskInsertControllerP {
	
	@GetMapping
	public String taskInsert(@PathVariable String lecCode) {
		return "professor/cyber/task/taskForm";
	}

}
