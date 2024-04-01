package kr.or.ddit.manager.pro.proroom.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
@RequestMapping("manager/pro/proRoom")
public class ProRoomRetrieveControllerM {
	
	//교수 목록 조회
	@GetMapping
	public String proRoomList() {
		return "tiles:manager/pro/proroom/proRoomList";
	}
	
	//싱세조회
	@GetMapping("{memNo}")
	public String proRoomView(@PathVariable String memNo) {
		return "manager/pro/proroom/proRoomView";
	}

}
