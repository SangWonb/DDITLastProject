package kr.or.ddit.member.handler;

import java.io.IOException;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.security.core.Authentication;
import org.springframework.security.web.authentication.SavedRequestAwareAuthenticationSuccessHandler;

import kr.or.ddit.vo.user.MemberVO;
import kr.or.ddit.vo.user.MemberVOWrapper;
import lombok.extern.slf4j.Slf4j;
@Slf4j
public class CustomAuthenticationSuccessHandler extends SavedRequestAwareAuthenticationSuccessHandler {
	@Override
	public void onAuthenticationSuccess(HttpServletRequest request, HttpServletResponse response,
		Authentication authentication) throws ServletException, IOException {
		MemberVOWrapper principal = (MemberVOWrapper) authentication.getPrincipal();
		MemberVO realUser = principal.getRealUser();
		log.info("custom success handler 처리. 로그인에 성공한 사용자는 {}", realUser.getMemName());
		
		
		HttpSession session = request.getSession();
		
		String memName = realUser.getMemName();
        String memNo = realUser.getMemNo();
        String DeptName = realUser.getDeptName();
        List<String> Roles = realUser.getMemRoles();
        
        List<String> rolesDescriptions = new ArrayList<>();
        for (String role : Roles) {
        	session.setAttribute("role", role);
            switch (role) {
                case "ROLE_S":
                    rolesDescriptions.add("학생");
                    break;
                case "ROLE_P":
                    rolesDescriptions.add("교수");
                    break;
                case "ROLE_M":
                    rolesDescriptions.add("교직원");
                    break;
                case "ROLE_D":
                    rolesDescriptions.add("학과장");
                    break;
                default:
                    // 만약 알 수 없는 역할이 있다면 처리 방법 (예시: 무시하거나, '알 수 없는 역할' 등으로 표시)
                    rolesDescriptions.add("알 수 없는 역할");
                    break;
            }
        }
        
        //세션에 추가
        session.setAttribute("memName", memName);
        session.setAttribute("memNo", memNo);
        session.setAttribute("DeptName", DeptName);
        session.setAttribute("RolesDescriptions", rolesDescriptions);
		
		
		
		//세션 24시간 설정 //로그아웃 시킬려구
		session.setMaxInactiveInterval(60 * 60 * 24);
		
		// 현재 시간(milliseconds) 가져오기
		long currentTimeMillis = System.currentTimeMillis();

		// 세션 만료 시간 구하기
		long expirationTimeMillis = currentTimeMillis + (30 * 60 * 1000);
		
		String sessionOverTime = String.valueOf(expirationTimeMillis);
		
		//세션 쿠키 설정
		Cookie cookie = new Cookie("KHRUsession", sessionOverTime);
		cookie.setMaxAge(30 * 60); // 30분 유지
		response.addCookie(cookie);
		
		//새회원인지 확인 (비밀번호가 6자리인 사람 : 임시발급 비번)
		if(realUser.getMemPass().length() == 6) {
			getRedirectStrategy().sendRedirect(request, response, "/myLogin/pwReset");
	    } else {
	        super.onAuthenticationSuccess(request, response, authentication);
	    }
	}
}
