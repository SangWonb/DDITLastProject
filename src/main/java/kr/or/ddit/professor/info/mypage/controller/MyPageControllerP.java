package kr.or.ddit.professor.info.mypage.controller;

import javax.inject.Inject;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;

import kr.or.ddit.enumpkg.ServiceResult;
import kr.or.ddit.professor.info.mypage.service.MyPagePService;
import kr.or.ddit.utils.annotation.RealUser;
import kr.or.ddit.vo.user.MemberVO;
import kr.or.ddit.vo.user.ProfessorVO;

@Controller
@RequestMapping("/professor/info/mypage/myPage")
public class MyPageControllerP {
	
	@Inject
	MyPagePService service;
	
	@GetMapping
	public String myPage(
		Model model,
		@RealUser MemberVO mem
		) {
	String memNo = mem.getMemNo();
	
	ProfessorVO pInfo = service.retrieveMyInfo(memNo);
	
	model.addAttribute("pInfo",pInfo);
	model.addAttribute("contentTitle","개인정보");
	
	return "tiles:professor/info/mypage/myPage";
	}
	
	@PostMapping(consumes = "application/json" )
	public ServiceResult memInfoMod(
			@RequestBody MemberVO memberVO
			) {
		ServiceResult result =service.modifyMyInfo(memberVO);
		return result;
	}

}
