package kr.or.ddit.common.info.calendar.service;

import java.lang.reflect.Member;
import java.util.List;

import kr.or.ddit.enumpkg.ServiceResult;
import kr.or.ddit.vo.common.CalendarVO;
import kr.or.ddit.vo.user.MemberVO;

public interface CalendarService {
	public List<CalendarVO> retrieveScheduleA();
	public List<CalendarVO> retrieveScheduleD(String memNo);
	public List<CalendarVO> retrieveScheduleM(String memNo);
	
	/**
	 * @param memNo 사용자가 저장한 커스텀 캘린더 조회하기 
	 * @return
	 */
	public List<CalendarVO> retrieveScheduleSaved(MemberVO mem);
	
	public ServiceResult addSchedule(CalendarVO newSchedule);
	public ServiceResult modSchedule(CalendarVO modSchedule);
	public ServiceResult removeSchedule(String cldrCode);
}
