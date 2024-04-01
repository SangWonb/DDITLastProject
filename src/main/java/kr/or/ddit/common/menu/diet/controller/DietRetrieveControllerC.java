package kr.or.ddit.common.menu.diet.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
@RequestMapping("common/menu/diet")
public class DietRetrieveControllerC {
	
	@GetMapping
	public String dietView() {
		return "tiles:common/menu/diet/dietView";
	}
	
}
