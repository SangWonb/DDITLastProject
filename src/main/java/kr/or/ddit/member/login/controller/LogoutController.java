package kr.or.ddit.member.login.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
@RequestMapping("/logout")
public class LogoutController {
	
	@PostMapping
	public String logout() {
		return "redirect:/login";
	}
	
}
