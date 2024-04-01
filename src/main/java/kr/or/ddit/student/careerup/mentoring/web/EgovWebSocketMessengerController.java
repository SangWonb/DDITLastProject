package kr.or.ddit.student.careerup.mentoring.web;

import java.util.UUID;

import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import kr.or.ddit.student.careerup.mentoring.cmm.LoginVO;
import kr.or.ddit.utils.annotation.RealUser;
import kr.or.ddit.vo.user.MemberVO;
import lombok.extern.slf4j.Slf4j;

@Slf4j
@Controller
public class EgovWebSocketMessengerController {

	/**
	 * 웹소켓 메신저 접속화면으로 이동한다.
	 *
	 * @param session 사용자세션
	 * @param model   모델
	 * @return view name
	 */
	@RequestMapping(value = "/student/careerup/mentoring/msg/EgovMessenger.do")
	public String websocketMessengerView(

			HttpSession session, ModelMap model

	) {

		model.addAttribute("loginVO", session.getAttribute("loginVO"));
		return "student/careerup/mentoring/msg/EgovMessenger";
	}

	/**
	 * 웹 소켓 메신저 메인화면(대화상대 리스트화면)으로 이동한다.
	 *
	 * @param session 사용자세션
	 * @param model   모델
	 * @return view name
	 */
	@RequestMapping(value = "/student/careerup/mentoring/msg/websocketMessengerMain.do")
	public String websocketMessengerMain(

			HttpSession session, @RealUser MemberVO mem, ModelMap model

	) {
		
		model.addAttribute("loginVO", session.getAttribute("loginVO"));
		return "student/careerup/mentoring/msg/EgovMessengerMain";
	}

	/**
	 * 대화창을 새로 띄운다.
	 *
	 * @param roomId   대화창 아이디
	 * @param username 대화상대 이름
	 * @param session  사용자세션
	 * @param model    모델
	 * @return view name
	 */
	@RequestMapping(value = "/student/careerup/mentoring/msg/websocketMessengePopup.do")
	public String websocketMessengePopup(

			@RequestParam(value = "chatId", required = false) String chatId,

			@RequestParam(value = "username", required = false) String username,
			@RealUser MemberVO mem,
			HttpSession session,

			ModelMap model

	) {

//		model.addAttribute("loginVO", session.getAttribute("loginVO"));
		model.addAttribute("chatId", chatId);
		model.addAttribute("username", mem.getMemName());

		log.info("chatId : {}",chatId);
		log.info("loginVO : {}", mem);
		log.info("username : {}", mem.getMemName());
		
		return "student/careerup/mentoring/msg/popup/chatPopupBubble";
	}

	@RequestMapping(value = "/msg/session.do")
	public String websocketSession(

			HttpSession session, @RealUser MemberVO mem,  ModelMap model

	) {

		
		LoginVO loginVO = new LoginVO();
		loginVO.setId(mem.getMemNo());
		loginVO.setName(mem.getMemName());

		session.setAttribute("loginVO", loginVO);

		return "blank";
	}
}