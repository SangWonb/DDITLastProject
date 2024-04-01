package kr.or.ddit.professor.cyber.attendance.service;

import java.sql.SQLException;
import java.time.DayOfWeek;
import java.time.LocalDate;
import java.util.List;
import java.util.Map;

import kr.or.ddit.enumpkg.ServiceResult;
import kr.or.ddit.professor.cyber.attendance.vo.AttendInfoVO;
import kr.or.ddit.vo.cyber.AttendVO;
import kr.or.ddit.vo.user.StudentVO;

public interface AttendService {
	
	
	/**
	 * @return
	 * 출석해야할 날들 구하기 [dayvoList]
	 * 주차벌 수업일수 [weekMap]
	 * 실시 일수 [conducted]
	 */
	public Map<String , Object> findSchoolDayInfo (String lecCode);
	
	//해당하는 강의의 개강날짜 구하기
	public LocalDate retrieveStartDate(String lecCode);
	
	//해당 강의의 수업일수 구하기
	public int retrieveClassCount(String lecCode);
	
	//해당강의 수업 요일 구하기
	public List<DayOfWeek> retrieveDayList (String lecCode);
	
	/**
	 * 해당 강의 듣는 학생 리스트 가져오기
	 * @param lecCode
	 * @return
	 */
	public List<StudentVO> retrieveStudentList(String lecCode);
	
	/**
	 * /해당 강의 듣는 학생들 출석 리스트 가져오기
	 * @param lecCode
	 * @return
	 */
	public List<AttendInfoVO> retrieveAttendInfoList(String lecCode);
	
	
	/**
	 * 출석 리스트 업데이트
	 * @return
	 * @throws SQLException 
	 */
	public ServiceResult modifyAttendList(List<AttendVO> attendList);
	
	/**
	 * 한 학생의 출결 조회
	 * @param lecCode
	 * @param smemNo
	 * @return
	 */
	public AttendInfoVO retrieveAttendInfo(String lecCode, StudentVO student);
}
