package kr.or.ddit.student.info.tuition.dao;

import java.util.List;

import javax.inject.Inject;

import org.junit.jupiter.api.Test;

import kr.or.ddit.AbstractRootContextTest;
import kr.or.ddit.vo.info.EnrollInvoiceVO;
import lombok.extern.slf4j.Slf4j;

@Slf4j
class TuitionDAOSTest extends AbstractRootContextTest{

	@Inject
	TuitionDAOS dao;
	
	@Test
	void testSelectEnrollInvoiceList() {
		List<EnrollInvoiceVO> vo = dao.selectEnrollInvoiceList("202401001", "D01");
		log.info("{}",vo);
	}
}
