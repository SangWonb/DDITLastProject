package kr.or.ddit.student.info.academicchange.service;

import static org.junit.jupiter.api.Assertions.*;

import java.util.List;

import javax.inject.Inject;

import org.junit.jupiter.api.AfterAll;
import org.junit.jupiter.api.Test;

import kr.or.ddit.vo.info.AcademicRecordChangeVO;
import lombok.extern.slf4j.Slf4j;

@Slf4j
class AcademicChangeServiceTest {

	@Inject
	AcademicChangeService service;

	@Test
	void test() {
		String memNo = "201603082";
		List<AcademicRecordChangeVO> record=service.retrieveAcaRecordList(memNo);
		log.info("record",record);
		assertNull(record);
	}

}
