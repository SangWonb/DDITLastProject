package kr.or.ddit.student.info.mypage.controller;

import java.util.Random;

import javax.inject.Inject;
import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;

import kr.or.ddit.enumpkg.ServiceResult;
import kr.or.ddit.member.login.vo.AuthData;
import kr.or.ddit.student.info.mypage.service.MyPageSService;
import kr.or.ddit.utils.annotation.RealUser;
import kr.or.ddit.utils.sms.SmsUtil;
import kr.or.ddit.vo.user.MemberVO;
import kr.or.ddit.vo.user.StudentVO;
import lombok.extern.slf4j.Slf4j;
import net.nurigo.sdk.message.response.SingleMessageSentResponse;

@Slf4j
@Controller
@RequestMapping("student/info/mypage")
public class RetrieveMyPageControllerS {
	
	@Inject
	MyPageSService service;
	
	@GetMapping
	public String myPage(
			Model model,
			@RealUser MemberVO mem
			) {
		String memNo = mem.getMemNo();
		StudentVO sInfo = service.retrieveMyInfo(memNo);
		
		model.addAttribute("sInfo",sInfo);
		model.addAttribute("contentTitle","개인정보");
		
		return "tiles:student/info/mypage/myPage";
	}
	
	@PostMapping(consumes = "application/json" )
	public ServiceResult memInfoMod(
			@RequestBody MemberVO memberVO
			) {
		ServiceResult result =service.modifyMyInfo(memberVO);
		return result;
	}
	
	public boolean sendSmsToAuth(MemberVO findMember, HttpSession session) {
        String name = findMember.getMemName();
        //수신번호 형태에 맞춰 "-"을 ""로 변환
        String phoneNum = findMember.getMemTel().replaceAll("-","");
        
        //보낼 문자내용
        String authNumber = AuthNumberMaker();
        String authMsg = "[한인대학교] 아래의 인증번호를 입력해주세요.\n["+ authNumber +"]";
        SingleMessageSentResponse sendOne = SmsUtil.sendOne(phoneNum, authMsg);
        
        boolean result = sendOne.getStatusCode().equals("2000");
        
        log.info("\n\n\n\n\n===result===\n{}\n\n\n\n\n\n\n",result);
        
        if(result) {
        	session.setMaxInactiveInterval(60*3);
        	session.setAttribute("auth",new AuthData(authNumber));
        	return true;
        }else {
        	return false;
        }
    }
	
	//인증번호 만듦
	public String AuthNumberMaker() {
		
		Random random = new Random();
		int randomNumber = random.nextInt(9000) + 1000;
		
		return String.valueOf(randomNumber);
	}

	
	@GetMapping("/myCredits")
	public String myCredits() {
		return "tiles:student/info/mypage/myCredits";
	}
}
