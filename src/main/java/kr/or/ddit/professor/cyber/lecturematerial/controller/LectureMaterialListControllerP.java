package kr.or.ddit.professor.cyber.lecturematerial.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
@RequestMapping("/professor/cyber/lecturematerial/lectureMaterialList")
public class LectureMaterialListControllerP {

	
	@GetMapping
	public String list() {
		
		return "professor/cyber/lecturematerial/lectureMaterialList";
	}
}
