package kr.or.ddit.professor.cyber.dao;

import java.time.DayOfWeek;
import java.time.LocalDate;
import java.time.format.TextStyle;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Locale;
import java.util.Map;

import javax.inject.Inject;

import org.junit.jupiter.api.Test;
import org.springframework.test.context.junit.jupiter.web.SpringJUnitWebConfig;

import kr.or.ddit.professor.cyber.attendance.vo.DayVO;
import kr.or.ddit.utils.paging.PaginationInfo;
import kr.or.ddit.vo.cyber.LecOpenListVO;
import kr.or.ddit.vo.cyber.LectureVO;
import lombok.extern.slf4j.Slf4j;

@Slf4j
@SpringJUnitWebConfig(locations = "file:src/main/resources/kr/or/ddit/spring/conf/*-context.xml")
class CyberMainDAOPTest {
	
	@Inject
	CyberMainDAOP dao;
	
	@Test
	void testSelectLOLListP() {
		
//		List<LecOpenListVO> lolList = dao.selectLOLListP("201104511");
//		log.info("\n\n\n\n\n\n\n\n\n{}\n\n\n\n\n\n\n\n\n",lolList);
		
	}
	
	@Test
	void testSelectLectureListP() {
//		int selectTotalRecord = dao.selectTotalRecord("201104511");
		PaginationInfo paging = new PaginationInfo(2,2);
//		paging.setTotalRecord(selectTotalRecord);
		paging.setCurrentPage(1);
		
//		List<LectureVO> selectLectureListP = dao.selectLectureListP("201104511",paging);
//		log.info("========selectLectureListP======\n\n{}\n\n\n",selectLectureListP);
	}
	
	@Test
	void testSelectTotalRecord() {
//		int selectTotalRecord = dao.selectTotalRecord("201104511");
//		log.info("selectTotalRecord : {}",selectTotalRecord);
	}
	
	@Test
	void testAttendence() {
		
		Map<String, Object> schoolDayInfo = new HashMap<String, Object>();
		
		List<DayOfWeek> dayList = new ArrayList<DayOfWeek>();
		dayList.add(DayOfWeek.THURSDAY);
		dayList.add(DayOfWeek.FRIDAY);
		
        LocalDate date = LocalDate.of(2024, 3, 2); // 시작일 설정
        
        int classCount = 5; //수업일수
        
        /////////////////////////////////////////////////////////////////////////////////
        
        Map<String, Integer> weekMap = new HashMap<String, Integer>(); //주차별 몇번 수업하는지
        List<DayVO> dayvoList = new ArrayList<DayVO>(); // 수업일수 정보
        
        int conducted = 0; //실시일수
        int week = 0; //주차
        int weekCnt = 0; //주차별 수업일수
        int count = 0; // 해당 요일이 맞으면 카운트
        while (count < classCount) { // 32일 동안 반복
            DayOfWeek dayOfWeek = date.getDayOfWeek(); // 현재 요일 가져오기
            
            for(DayOfWeek day:dayList) {
            	
            	// 목요일 또는 금요일인 경우에만 처리
            	if (dayOfWeek == day) {
            		
            		if(week == 0) {
            			week = 1;
            		}
            		
            		count++; // 카운트 증가
            		weekCnt ++;
            		if(LocalDate.now().isEqual(date) || LocalDate.now().isAfter(date)) {
            			conducted++;
            		}
            		
            		String displayName = dayOfWeek.getDisplayName(TextStyle.SHORT, Locale.KOREAN);
            		log.info("\n\ndate : {}\n주차 : {}\n월 : {}\n일 : {}\n요일 : {}\n\n\n",date,week,date.getMonthValue(),date.getDayOfMonth(),displayName);
            		
            		DayVO dayvo = new DayVO(week, date.getMonthValue(), date.getDayOfMonth(), displayName, date);
            		dayvoList.add(dayvo);
            				
            		if(count == classCount) {
            			weekMap.put(String.valueOf(week), weekCnt);        	
            		}
            	}
            }
            
            // 다음 날짜로 이동
            date = date.plusDays(1);

            // 주차를 나타내는 변수를 증가시키는 로직
            if (date.getDayOfWeek() == DayOfWeek.MONDAY) {
            	if(week != 0) {
            		weekMap.put(String.valueOf(week), weekCnt);
            		week++; // 월요일인 경우 주차 증가  		
            	}
            	weekCnt = 0;
            }
        }
        
        log.info("\n\n\n\n=========================\n{}\n\n\n\n\n",weekMap);
        log.info("\n\n\n\n=========================\n{}\n\n\n\n\n",dayvoList);
        log.info("\n\n\n\n=========================\n{}\n\n\n\n\n",conducted);
        schoolDayInfo.put("weekMap", weekMap);
        schoolDayInfo.put("dayvoList", dayvoList);
        schoolDayInfo.put("conducted", conducted);
        
		
	}

}
