package kr.or.ddit.member.login.controller;

import java.util.ArrayList;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.Random;

import javax.inject.Inject;
import javax.servlet.http.HttpSession;
import javax.validation.Valid;

import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.validation.FieldError;
import org.springframework.validation.ObjectError;
import org.springframework.validation.ValidationUtils;
import org.springframework.validation.annotation.Validated;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PatchMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import kr.or.ddit.enumpkg.ServiceResult;
import kr.or.ddit.member.dao.MemberDAO;
import kr.or.ddit.member.login.vo.AuthData;
import kr.or.ddit.utils.annotation.RealUser;
import kr.or.ddit.utils.sms.SmsUtil;
import kr.or.ddit.validate.DeleteGroup;
import kr.or.ddit.vo.user.MemberVO;
import lombok.extern.slf4j.Slf4j;
import net.nurigo.sdk.message.response.SingleMessageSentResponse;

@Slf4j
@Controller
@RequestMapping(value = {"/","/myLogin"})
public class LoginController {
	
	
	@Inject
	MemberDAO dao;
	
	//최초 접속시 로그인페이지로 연결
	@GetMapping
	public String loginProcess(Model model) {
		
		List<MemberVO> memList = dao.selectMemberList();
		model.addAttribute("memList", memList);
		
		return "tiles:login/loginForm";
	}

	//idFindForm.jsp 이동
	@GetMapping("idFind")
	public String idFind() {
		return "tiles:login/idFindForm";
	}
	//해당 사용자가 있는지 확인
	@PostMapping("idFind")
	public String idFindProcess(@RequestParam  Map<String, String> idFineInfo, Model model, RedirectAttributes redirect) {
		
		MemberVO findMember = dao.findMember(idFineInfo);
		
		if(findMember == null) {
			redirect.addFlashAttribute("message", "해당하는 사용자가 없습니다.");
			return "redirect:/idFind";
		}else {
			String memNo = findMember.getMemNo();
			String maskedMemNo = memNo.substring(0, 2) + "**" + memNo.substring(4);
			redirect.addFlashAttribute("memNo", maskedMemNo);
			return "redirect:/idFind/show";
		}
	}
	@GetMapping("idFind/show")
	public String idFindShow() {
		return "tiles:login/idFindShow";
	}
	
	//pwResetForm.jsp 이동
	@GetMapping("pwReset")
	public String pwReset() {
		return "tiles:login/pwResetForm";
	}
	@PostMapping("pwReset")
	public String pwResetProcess(@RequestParam  Map<String, String> pwResetInfo, Model model, HttpSession session) {
		
		MemberVO findMember = dao.findMemberPW(pwResetInfo);
		
		if(findMember == null) {
			model.addAttribute("success", false);
			model.addAttribute("message", "해당하는 사용자가 없습니다.");
		}else {
			if(sendSmsToAuth(findMember, session)) {
				session.setAttribute("authMember", findMember);
				model.addAttribute("success", true);
			}else {
				model.addAttribute("success", false);
				model.addAttribute("message", "인증번호 발송에 실패하였습니다.");
			}
		}
		return "jsonView";
	}
	
	@PostMapping("pwReset/auth")
	public String pwResetAuth(HttpSession session, @RequestBody Map<String, String> authNumMap, Model model) {
		String authNum = authNumMap.get("authNum");
		
		Object o = session.getAttribute("auth");
		if( o != null && o instanceof AuthData ){
		    AuthData authData = (AuthData)o;
		    if( new Date().getTime() - authData.getTime() <= 5 * 60 * 1000 ){
		        if(authData.getNumberString().equals(authNum)){
		        	session.setMaxInactiveInterval(60*60); //1시간으로 재설정
		        	session.removeAttribute("auth");
		        	model.addAttribute("success", true);
		        }else{
		        	model.addAttribute("success", false);
		        	model.addAttribute("message", "인증번호가 맞지 않습니다.");
		        }
		    }else{
		    	model.addAttribute("success", false);
		    	model.addAttribute("message", "시간이 초과되었습니다.");
		    }
		}else{
			model.addAttribute("success", false);
			model.addAttribute("message", "발급한 인증번호가 없습니다.");
		}
		
		return "jsonView";
	}
	
	@GetMapping("pwReset/pwChange")
	public String pwResetResetForm() {
		return "tiles:login/pwChangeForm";
	}
	@PostMapping("pwReset/pwChange")
	public String pwResetResetProcess(
		@Validated(DeleteGroup.class) @ModelAttribute("mem") MemberVO mem
		,BindingResult errors
		,Model model, RedirectAttributes redirect, HttpSession session
	) {
		
		if(!errors.hasErrors()) {
			
			redirect.addFlashAttribute("success", true);
			MemberVO authMember = (MemberVO) session.getAttribute("authMember");
			session.removeAttribute("authMember");
			authMember.setMemPass(mem.getMemPass());
			if(dao.pwReset(authMember) > 0) {
				return "redirect:/";
			}else {
				redirect.addFlashAttribute("message", "서버에러");
			}
			
		}else {
			List<Map<String, String>> errMsg = new ArrayList<Map<String,String>>();
			List<ObjectError> allErrors = errors.getAllErrors();
			for(ObjectError err:allErrors) {
				if(err instanceof FieldError) {
		            FieldError fieldError = (FieldError) err;
		            Map<String, String> errM = new HashMap<String, String>();
		            errM.put(fieldError.getField(), err.getDefaultMessage());
		            errMsg.add(errM);
		        }
			}
			
			log.info("\n\n\n\n\n\n{}\n\n\n\n\n\n",errMsg);
			redirect.addFlashAttribute("errMsg", errMsg);
		}
		
		return "redirect:/pwReset/pwChange";
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
	
	
}
