package kr.or.ddit.manager.com.memberregistrate.dao;

import static org.junit.jupiter.api.Assertions.*;

import javax.inject.Inject;

import org.junit.jupiter.api.Test;
import org.springframework.test.context.junit.jupiter.web.SpringJUnitWebConfig;

import lombok.extern.slf4j.Slf4j;

@Slf4j
@SpringJUnitWebConfig(locations = "file:src/main/resources/kr/or/ddit/spring/conf/*-context.xml")
class MemberRegistrateDAOTest {
	
	@Inject
	MemberRegistrateDAO dao;
	
	
	@Test
	void testInsertMemRoles() {
		fail("Not yet implemented");
	}

	@Test
	void testInsertMember() {
		fail("Not yet implemented");
	}

	@Test
	void testInsertManager() {
		fail("Not yet implemented");
	}

	@Test
	void testInsertStudent() {
		fail("Not yet implemented");
	}

	@Test
	void testInsertProfessor() {
		fail("Not yet implemented");
	}

	@Test
	void testSelectSmemNo() {
		
		String selectSmemNo = dao.selectSmemNo("202404","202404%");
		log.info("\n\n\n{}\n\n\n",selectSmemNo);
		
		
	}

	@Test
	void testSelectPmemNo() {
		fail("Not yet implemented");
	}

	@Test
	void testSelectMmemNo() {
		fail("Not yet implemented");
	}

}
