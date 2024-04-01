package kr.or.ddit.manager.com.popup.loginpopup.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
@RequestMapping("/manager/com/popup/loginpopup/loginPopup")
public class LoginPopupControllerM {

	@GetMapping
	public String list() {
		return "manager/com/popup/loginpopup/loginPopup";
	}
}
