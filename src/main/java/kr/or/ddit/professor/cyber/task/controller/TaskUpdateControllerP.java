package kr.or.ddit.professor.cyber.task.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
@RequestMapping("professor/cyber/{lecCode}/taskUpdate/{taskCode}")
public class TaskUpdateControllerP {
	
	@GetMapping
	public String taskUpdate(@PathVariable String lecCode, @PathVariable String taskCode) {
		return "professor/cyber/task/taskEdit";
	}

}
