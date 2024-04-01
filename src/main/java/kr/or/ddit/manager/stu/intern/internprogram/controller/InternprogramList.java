package kr.or.ddit.manager.stu.intern.internprogram.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
@RequestMapping("/manager/stu/intern/internprogram/")
public class InternprogramList {

	@GetMapping("internprogramList")
	public String list() {
		return "tiles:manager/stu/intern/internprogram/internprogramList";
	}
}
