package kr.or.ddit.manager.pro.laboratory.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
@RequestMapping("manager/pro/laboratory")
public class LaboratoryRetrieveControllerM {
	
	//교수 목록 조회
	@GetMapping
	public String laboratoryList() {
		return "tiles:manager/pro/laboratory/laboratoryList";
	}
	
	//싱세조회
	@GetMapping("{memNo}")
	public String laboratoryView(@PathVariable String memNo) {
		return "manager/pro/laboratory/laboratoryView";
	}
	
	
}
