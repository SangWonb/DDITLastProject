package kr.or.ddit.manager.com.calendar.academiccalendar.dao;

import static org.junit.jupiter.api.Assertions.*;

import javax.inject.Inject;

import org.junit.jupiter.api.AfterAll;
import org.junit.jupiter.api.Test;

import kr.or.ddit.vo.common.CalendarVO;
import lombok.extern.slf4j.Slf4j;

@Slf4j
class AcaCalendarDAOTest {

	@Inject
	private AcaCalendarDAO dao;
	
	
	@Test
	void test() {
		CalendarVO newInfo = new CalendarVO();
		
		newInfo.setMemNo("202204033");
		
		log.info("이거다:{}",dao.insertNewInfo(newInfo));
	}

}
