package kr.or.ddit.vo.user;

import java.util.Collection;
import java.util.stream.Collectors;

import org.springframework.security.core.GrantedAuthority;
import org.springframework.security.core.authority.SimpleGrantedAuthority;
import org.springframework.security.core.userdetails.User;

import lombok.extern.slf4j.Slf4j;

@Slf4j
public class MemberVOWrapper extends User{
	
	private MemberVO realUser;

	public MemberVOWrapper(MemberVO realUser) {
		
		super(realUser.getMemNo(), realUser.getMemPass(), 
				realUser.getMemRoles().stream()
									.map(SimpleGrantedAuthority::new)
									.collect(Collectors.toList()));
		
		log.info("\n\n\n\n\n\n\n\n\n\n\n\n\n\n====\n{}\n====\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n",realUser);
		
		this.realUser = realUser;
	}
	
	public MemberVO getRealUser() {
		return realUser;
	}
	
}
