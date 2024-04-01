package kr.or.ddit.student.info.academicchange.dao;

import static org.junit.jupiter.api.Assertions.*;

import java.util.List;

import javax.inject.Inject;

import org.junit.jupiter.api.Test;

import kr.or.ddit.enumpkg.ServiceResult;
import kr.or.ddit.vo.info.AcademicRecordChangeVO;
import lombok.extern.slf4j.Slf4j;

@Slf4j
class AcademicChangeDAOTest {

	@Inject
	AcademicChangeDAO dao;

	@Test
	void updateOne() {
		fail("Not yet implemented");
	}
	@Test
	void deleteOne() {
		String arcNo="A240216001";
		
	}

	@Test
	void testSelectList() {
		String memNo = "201603082";
		List<AcademicRecordChangeVO> record=dao.selectList(memNo);
		log.info("record",record);
		assertNull(record);
	}

	@Test
	void selectType() {
		fail("Not yet implemented");
	}


	@Test
	void testSelectOne() {
		fail("Not yet implemented");
	}

	@Test
	void insertOne() {
		fail("Not yet implemented");
	}

}
