package kr.or.ddit.student.careerup.test.cotest.dao;

import static org.junit.jupiter.api.Assertions.*;

import javax.inject.Inject;

import org.junit.jupiter.api.Test;

import kr.or.ddit.AbstractRootContextTest;
import kr.or.ddit.vo.careerup.CotestResultVO;
import lombok.extern.slf4j.Slf4j;

@Slf4j
class CotestDAOTest extends AbstractRootContextTest {

	@Inject 
	private CotestDAO dao;

	@Test
	void test() {
		String memNo = "202204033";
		String deptCode = "D04";
		
		CotestResultVO avg = dao.selectAvg();
		CotestResultVO deptAvg = dao.selectDeptAvg(deptCode);
		CotestResultVO myAvg = dao.selesctMyAvg(memNo);
		
		log.info("avg:{}",avg);
		log.info("deptAvg:{}",deptAvg);
		log.info("myAvg:{}",myAvg);
	}

}
