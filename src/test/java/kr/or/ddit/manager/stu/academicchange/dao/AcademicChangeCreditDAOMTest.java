package kr.or.ddit.manager.stu.academicchange.dao;

import java.util.List;

import javax.inject.Inject;

import org.junit.jupiter.api.Test;

import kr.or.ddit.AbstractRootContextTest;
import kr.or.ddit.vo.info.AcademicRecordChangeVO;
import lombok.extern.slf4j.Slf4j;

@Slf4j
class AcademicChangeCreditDAOMTest extends AbstractRootContextTest{
	
	@Inject
	AcademicChangeCreditDAOM dao;

	@Test
	void testSelectCreditList() {
		List<AcademicRecordChangeVO> selectCreditList = dao.selectCreditList("202107004");
		log.info("\n\n{}\n\n",selectCreditList);
	}
}
