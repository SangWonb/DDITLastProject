package kr.or.ddit.professor.cyber.attendance.service;

import static org.junit.jupiter.api.Assertions.*;

import java.time.DayOfWeek;
import java.time.LocalDate;
import java.util.List;

import javax.inject.Inject;

import org.junit.jupiter.api.Test;
import org.springframework.test.context.junit.jupiter.web.SpringJUnitWebConfig;

import kr.or.ddit.professor.cyber.attendance.dao.AttendDAO;
import kr.or.ddit.professor.cyber.attendance.vo.AttendInfoVO;
import lombok.extern.slf4j.Slf4j;

@Slf4j
@SpringJUnitWebConfig(locations = "file:src/main/resources/kr/or/ddit/spring/conf/*-context.xml")
class AttendServiceImplTest {
	
	@Inject
	AttendService service;
	
	@Test
	void testFindSchoolDayInfo() {
		service.findSchoolDayInfo("LEC002");
	}

	@Test
	void testRetrieveStartDate() {
		LocalDate retrieveStartDate = service.retrieveStartDate("LEC002");
		log.info("\n\n\n\n\n\nretrieveStartDate\n{}\n\n\n\n\n",retrieveStartDate);
	}

	@Test
	void testRetrieveClassCount() {
		fail("Not yet implemented");
	}

	@Test
	void testRetrieveDayList() {
	
		List<DayOfWeek> retrieveDayList = service.retrieveDayList("LEC002");
		
		log.info("\n\n\n\nretrieveDayList\n{}\n\n\n\n\n",retrieveDayList);
	
	
	}
	
	@Test
	void testtest() {
		
		List<AttendInfoVO> attendInfoList = service.retrieveAttendInfoList("LEC002");
		for(AttendInfoVO attendInfo: attendInfoList) {
			
			log.info("\n\n\n\n\n\n\n\n====attendInfo====\n{}\n\n\n\n\n\n\n",attendInfo);
			
		}
		
		
		
		
		
	}

}
