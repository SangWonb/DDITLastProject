package kr.or.ddit.student.info.scholarship.dao;

import static org.junit.jupiter.api.Assertions.fail;

import java.util.List;

import javax.inject.Inject;

import org.junit.jupiter.api.Test;

import kr.or.ddit.AbstractRootContextTest;
import kr.or.ddit.vo.info.ScholashipRecVO;
import lombok.extern.slf4j.Slf4j;

@Slf4j
class ScholarshipDAOTest extends AbstractRootContextTest{
	
	@Inject
	ScholarshipDAO dao;

	@Test
	void testInsert() {
		fail("Not yet implemented");
	}

	@Test
	void testSelect() {
		fail("Not yet implemented");
	}

	@Test
	void testSelectTotalRecord() {
		fail("Not yet implemented");
	}

	@Test
	void testSelectList() {
		List<ScholashipRecVO> vo = dao.scholashipRecList("201713502");
		log.info("{}",vo);
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