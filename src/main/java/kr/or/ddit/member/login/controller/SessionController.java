package kr.or.ddit.member.login.controller;

import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import lombok.extern.slf4j.Slf4j;

@Controller
@Slf4j
@RequestMapping("/session")
public class SessionController {
	
	//시간연장요청
	@GetMapping("timeExtension")
	public String timeExtension(Model model, HttpServletRequest request, HttpServletResponse response) {
		
		
		 // 세션의 만료 시간을 24시간으로 설정 >> 어쩌피 모달로 로그아웃 시킴
		HttpSession session = request.getSession();
	    session.setMaxInactiveInterval(60 * 60 * 24); //24시간
		
	    // 현재 시간(milliseconds) 가져오기
 		long currentTimeMillis = System.currentTimeMillis();

 		// 세션 만료 시간 구하기
 		long expirationTimeMillis = currentTimeMillis + (30 * 60 * 1000);
 		
 		String sessionOverTime = String.valueOf(expirationTimeMillis);
	    
	    model.addAttribute("success", true);
	    model.addAttribute("sessionOverTime", sessionOverTime);
		
		return "jsonView";
	}
	
	//세션만료 모달창 요청
	@GetMapping("sessionOverModal")
	public String sessionOverModal() {
		
		return "login/sessionOverModal";
	}
}
