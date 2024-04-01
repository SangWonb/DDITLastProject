package kr.or.ddit.manager.stu.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
@RequestMapping("manager/stu/")
public class RetrieveStudentControllerM {

	@GetMapping("studentList")
	public String list() {
		return "tiles:manager/stu/studentList";
	}
	
	@GetMapping("studentDetails")
	public String details() {
		return "manager/stu/studentDetails";
	}
}
