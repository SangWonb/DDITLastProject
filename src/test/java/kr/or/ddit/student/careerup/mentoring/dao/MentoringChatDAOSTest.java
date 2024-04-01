package kr.or.ddit.student.careerup.mentoring.dao;

import static org.junit.jupiter.api.Assertions.*;

import javax.inject.Inject;

import org.junit.jupiter.api.Test;

import kr.or.ddit.AbstractRootContextTest;

class MentoringChatDAOSTest extends AbstractRootContextTest{

	@Inject
	MentoringChatDAOS dao;
	
	@Test
	void testSelectMenteeMentoringList() {
		dao.selectMenteeMentoringList("");
	}

	@Test
	void testSelectMentorMentoringList() {
		fail("Not yet implemented");
	}

	@Test
	void testInsertChatId() {
		fail("Not yet implemented");
	}

}
