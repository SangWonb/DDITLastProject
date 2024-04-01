package kr.or.ddit.student.careerup.mentoring.mentoringmentee.dao;

import static org.junit.jupiter.api.Assertions.fail;

import javax.inject.Inject;

import org.junit.jupiter.api.Test;

import kr.or.ddit.AbstractRootContextTest;
import kr.or.ddit.vo.careerup.MenteeVO;
import lombok.extern.slf4j.Slf4j;

@Slf4j
class MenteeApplDAOSTest extends AbstractRootContextTest{
	
	@Inject
	MenteeApplDAOS dao;

	@Test
	void testSelectRecord() {
		fail("Not yet implemented");
	}

	@Test
	void testInsert() {
		fail("Not yet implemented");
	}

	@Test
	void testSelect() {
		MenteeVO vo = dao.select("MEN00001");
		log.info("\n\n\n{}\n\n\n",vo);
	}

	@Test
	void testSelectTotalRecord() {
		fail("Not yet implemented");
	}

	@Test
	void testSelectList() {
		fail("Not yet implemented");
	}

	@Test
	void testUpdate() {
		fail("Not yet implemented");
	}

	@Test
	void testDelete() {
		fail("Not yet implemented");
	}

}
