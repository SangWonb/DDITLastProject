package kr.or.ddit.student.careerup.employment.graduateemployment.dao;

import static org.junit.jupiter.api.Assertions.*;

import javax.inject.Inject;

import org.junit.jupiter.api.Test;

import kr.or.ddit.AbstractRootContextTest;
import kr.or.ddit.vo.careerup.SeniorCoworkerVO;
import lombok.extern.slf4j.Slf4j;

@Slf4j
class GraduateEmploymentDAOSTest extends AbstractRootContextTest{
	
	@Inject
	GraduateEmploymentDAOS dao;

	@Test
	void testInsert() {
		fail("Not yet implemented");
	}

	@Test
	void testSelect() {
		SeniorCoworkerVO vo = dao.select("SR00002");
		log.info("\n\n{}\n\n",vo);
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
