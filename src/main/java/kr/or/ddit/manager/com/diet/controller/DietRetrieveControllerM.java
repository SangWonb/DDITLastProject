package kr.or.ddit.manager.com.diet.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
@RequestMapping("manager/com/diet")
public class DietRetrieveControllerM {
	
	@GetMapping
	public String dietList() {
		return "tiles:manager/com/diet/dietList";
	}
	
	@GetMapping("{menucalCode}")
	public String dietView(@PathVariable String menucalCode) {
		return "manager/com/diet/dietView";
	}
	
}
