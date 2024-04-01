package kr.or.ddit.student.cyber.exam.dao;

import static org.junit.jupiter.api.Assertions.*;

import javax.inject.Inject;

import org.junit.jupiter.api.AfterAll;
import org.junit.jupiter.api.Test;

import kr.or.ddit.AbstractRootContextTest;
import kr.or.ddit.enumpkg.ServiceResult;
import kr.or.ddit.vo.cyber.TestGradeVO;
import lombok.extern.slf4j.Slf4j;

@Slf4j
class ExamDAOSTest extends AbstractRootContextTest {

	@Inject
	private ExamDAOS dao;

	@Test
	void test() {
		TestGradeVO newInfo = new TestGradeVO();
		
		newInfo.setLhCode("LH0000029");
		newInfo.setSmemNo("202204033");
		newInfo.setLtCode("LT20240002");
		newInfo.setTgRecord("985");

		log.info("newInfo",newInfo);
		
		int result = dao.insertNewGrade(newInfo);
		
		log.info("result",result);
	}

}
