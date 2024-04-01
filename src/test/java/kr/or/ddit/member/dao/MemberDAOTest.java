package kr.or.ddit.member.dao;

import static org.junit.jupiter.api.Assertions.*;

import java.util.HashMap;
import java.util.Map;

import javax.inject.Inject;

import org.junit.jupiter.api.Test;
import org.springframework.test.context.junit.jupiter.web.SpringJUnitWebConfig;

import kr.or.ddit.vo.user.MemberVO;
import lombok.extern.slf4j.Slf4j;

@Slf4j
@SpringJUnitWebConfig(locations = "file:src/main/resources/kr/or/ddit/spring/conf/*-context.xml")
class MemberDAOTest {
	
	@Inject
	MemberDAO dao;
	
	
	
	@Test
	void testSelectMemberByUsername() {
		MemberVO selectMemberByUsername = dao.selectMemberByUsername("202499001");
		log.info("\n\n\n{}\n\n\n",selectMemberByUsername);
	}
	
	@Test
	void testfindMember() {
		
		Map<String, String> findInfo = new HashMap<String, String>();
		findInfo.put("authMethod", "authEmail");
		findInfo.put("memName", "박세은");
		findInfo.put("memEmail", "alpha999@garadata.com");
		
		MemberVO findMember = dao.findMember(findInfo);
		log.info("\n\n==findMember==\n{}\n\n",findMember);
		
	}

}
