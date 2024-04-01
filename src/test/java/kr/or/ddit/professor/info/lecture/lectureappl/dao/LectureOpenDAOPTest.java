package kr.or.ddit.professor.info.lecture.lectureappl.dao;

import static org.junit.jupiter.api.Assertions.*;

import java.util.List;

import javax.inject.Inject;

import org.junit.jupiter.api.Test;

import kr.or.ddit.AbstractRootContextTest;
import kr.or.ddit.vo.cyber.LecOpenListVO;
import lombok.extern.slf4j.Slf4j;

@Slf4j
class LectureOpenDAOPTest extends AbstractRootContextTest{

	@Inject
	LectureOpenDAOP dao;
	
	@Test
	void testSelectRecord() {
		fail("Not yet implemented");
	}

	@Test
	void testSelectLectureApplList() {
		List<LecOpenListVO> selectLectureApplList = dao.selectLectureApplList("201104511");
		log.info("{}",selectLectureApplList);
	}

	@Test
	void testSelectLectureAppl() {
		LecOpenListVO selectLectureAppl = dao.selectLectureAppl("APP0021");
		log.info("{}",selectLectureAppl.getLecturePlan().getLectureContent());
	}

	@Test
	void testLectureApplInserst() {
		fail("Not yet implemented");
	}

	@Test
	void testLectureApplUpdate() {
		fail("Not yet implemented");
	}

	@Test
	void testLectureApplDelete() {
		fail("Not yet implemented");
	}

	@Test
	void testSelectLectureDecisionList() {
		fail("Not yet implemented");
	}

	@Test
	void testLectureDecisionUpdate() {
		fail("Not yet implemented");
	}

	@Test
	void testSelectLolAppNo() {
		fail("Not yet implemented");
	}

	@Test
	void testUpdateLolAppNo() {
		fail("Not yet implemented");
	}

}
