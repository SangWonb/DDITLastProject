package kr.or.ddit.professor.cyber.attendance.service;

import java.sql.SQLException;
import java.time.DayOfWeek;
import java.time.LocalDate;
import java.time.format.TextStyle;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Locale;
import java.util.Map;

import javax.inject.Inject;
import javax.transaction.Transactional;

import org.springframework.stereotype.Service;

import kr.or.ddit.enumpkg.ServiceResult;
import kr.or.ddit.professor.cyber.attendance.dao.AttendDAO;
import kr.or.ddit.professor.cyber.attendance.vo.AttendInfoVO;
import kr.or.ddit.professor.cyber.attendance.vo.DayVO;
import kr.or.ddit.student.info.signupclasses.vo.SignUpVO;
import kr.or.ddit.vo.cyber.AttendVO;
import kr.or.ddit.vo.cyber.LectureTimeVO;
import kr.or.ddit.vo.user.StudentVO;
import lombok.extern.slf4j.Slf4j;

@Slf4j
@Service
public class AttendServiceImpl implements AttendService {
	
	@Inject
	AttendDAO dao;
	
	@Override
	public Map<String, Object> findSchoolDayInfo(String lecCode) {
		
		Map<String, Object> schoolDayInfo = new HashMap<String, Object>();
		
		List<DayOfWeek> dayList = retrieveDayList(lecCode);
        LocalDate date = retrieveStartDate(lecCode); // 시작일 설정
        int classCount = retrieveClassCount(lecCode); //수업일수
        
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
        
        schoolDayInfo.put("weekMap", weekMap);
        schoolDayInfo.put("dayvoList", dayvoList);
        schoolDayInfo.put("conducted", conducted);
		
		return schoolDayInfo;
	}

	@Override
	public LocalDate retrieveStartDate(String lecCode) {
		String lectureString = dao.selectLectureDate(lecCode);
		
		int lecyy = Integer.parseInt(lectureString.substring(0,4));
		int lecmm = Integer.parseInt(lectureString.substring(5,7));
		int lecdd = Integer.parseInt(lectureString.substring(8,10));
		
		LocalDate lectureDate = LocalDate.of(lecyy, lecmm, lecdd);
		
		int year = lectureDate.getYear();
		String yearS = String.valueOf(year).substring(2,4);
		
		String startString = null;
		
		if(lectureDate.isAfter(LocalDate.of(year, 1, 1)) || lectureDate.isEqual(LocalDate.of(year, 1, 1))) {
			if(lectureDate.isBefore(LocalDate.of(year, 6, 30)) || lectureDate.isEqual(LocalDate.of(year, 6, 30))) {
				startString = dao.selectStartDate(new SignUpVO(year,"1학기"));
			}
		}
		if(lectureDate.isAfter(LocalDate.of(year, 7, 1)) || lectureDate.isEqual(LocalDate.of(year, 7, 1))) {
			if(lectureDate.isBefore(LocalDate.of(year, 12, 31)) || lectureDate.isEqual(LocalDate.of(year, 12, 31))) {
				startString = dao.selectStartDate(new SignUpVO(year,"2학기"));
			}
		}
		
		int ssyy = Integer.parseInt(startString.substring(0,4));
		int ssmm = Integer.parseInt(startString.substring(5,7));
		int ssdd = Integer.parseInt(startString.substring(8,10));
		
		LocalDate startDate = LocalDate.of(ssyy, ssmm, ssdd);
		
		return startDate;
	}

	@Override
	public int retrieveClassCount(String lecCode) {
		return dao.selectClassCount(lecCode);
	}

	@Override
	public List<DayOfWeek> retrieveDayList(String lecCode) {
		
		List<DayOfWeek> dayList = new ArrayList<DayOfWeek>();
		
		List<LectureTimeVO> selectDayList = dao.selectDayList(lecCode);
		for(LectureTimeVO selectDay: selectDayList) {
			String ltDay = selectDay.getLtDay();
			switch (ltDay) {
			case "1": dayList.add(DayOfWeek.MONDAY);
				break;
			case "2": dayList.add(DayOfWeek.TUESDAY);
				break;
			case "3": dayList.add(DayOfWeek.WEDNESDAY);
				break;
			case "4": dayList.add(DayOfWeek.THURSDAY);
				break;
			case "5": dayList.add(DayOfWeek.FRIDAY);
				break;
			}
		}
		return dayList;
	}

	@Override
	public List<StudentVO> retrieveStudentList(String lecCode) {
		return dao.selectStudentList(lecCode);
	}

	@Override
	public List<AttendInfoVO> retrieveAttendInfoList(String lecCode) {
		
		List<AttendInfoVO> attendInfoList = new ArrayList<AttendInfoVO>();
		
		List<StudentVO> studentList = retrieveStudentList(lecCode);
		Map<String, Object> findSchoolDayInfo = findSchoolDayInfo(lecCode);
		List<DayVO> dayvoList = (List<DayVO>) findSchoolDayInfo.get("dayvoList");
		int conducted = (int) findSchoolDayInfo.get("conducted");
		
		for(StudentVO stu : studentList) {
			
			AttendInfoVO attendInfo = new AttendInfoVO(stu.getSmemNo(), stu.getMemName(), stu.getDeptName(), lecCode);
			List<AttendVO> attendList = new ArrayList<AttendVO>();
			for(DayVO day : dayvoList) {
				AttendVO attend = dao.selectAttend(new AttendVO(day.getDate(), lecCode, stu.getSmemNo()));
				if(attend == null) {
					attend = new AttendVO();
					attend.setAtDate(day.getDate());
					attend.setSmemNo(stu.getSmemNo());					
				}
				attendList.add(attend);
			}
			attendInfo.setAttendList(attendList);
			attendInfo.setAttendance(dao.selectAttendance(lecCode, stu.getSmemNo()));
			attendInfo.setAbsent(dao.selectAbsent(lecCode, stu.getSmemNo()));
			attendInfo.setLate(dao.selectLate(lecCode, stu.getSmemNo()));
			attendInfo.setLeave(dao.selectLeave(lecCode, stu.getSmemNo()));
			attendInfo.setConducted(conducted);
			attendInfoList.add(attendInfo);
		}
		
		return attendInfoList;
	}

	@Override
	@Transactional
	public ServiceResult modifyAttendList(List<AttendVO> attendList) {
		for(AttendVO attend: attendList) {
			if(attend.getAtCode().equals("미출결")) {
				attend.setAtCode(null);
			}
			if(dao.selectAttend(attend) != null) {
				if(dao.updateAttend(attend) < 1 ) {
					return ServiceResult.FAIL;
				}
			}else {
				if(dao.insertAttend(attend) < 1) {
					return ServiceResult.FAIL;
				}
			}
		}
		return ServiceResult.OK;
	}

	@Override
	public AttendInfoVO retrieveAttendInfo(String lecCode,  StudentVO student) {
		
		Map<String, Object> findSchoolDayInfo = findSchoolDayInfo(lecCode);
		List<DayVO> dayvoList = (List<DayVO>) findSchoolDayInfo.get("dayvoList");
		int conducted = (int) findSchoolDayInfo.get("conducted");
			
		AttendInfoVO attendInfo = new AttendInfoVO(student.getSmemNo(), student.getMemName(), student.getDeptName(), lecCode);
		List<AttendVO> attendList = new ArrayList<AttendVO>();
		for(DayVO day : dayvoList) {
			AttendVO attend = dao.selectAttend(new AttendVO(day.getDate(), lecCode, student.getSmemNo()));
			if(attend == null) {
				attend = new AttendVO();
				attend.setAtDate(day.getDate());
				attend.setSmemNo(student.getSmemNo());					
			}
			attendList.add(attend);
		}
		attendInfo.setAttendList(attendList);
		attendInfo.setAttendance(dao.selectAttendance(lecCode, student.getSmemNo()));
		attendInfo.setAbsent(dao.selectAbsent(lecCode, student.getSmemNo()));
		attendInfo.setLate(dao.selectLate(lecCode, student.getSmemNo()));
		attendInfo.setLeave(dao.selectLeave(lecCode, student.getSmemNo()));
		attendInfo.setConducted(conducted);
		
		return attendInfo;
	}

}


























