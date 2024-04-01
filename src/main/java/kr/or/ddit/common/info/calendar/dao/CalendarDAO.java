package kr.or.ddit.common.info.calendar.dao;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;

import kr.or.ddit.vo.common.CalendarVO;

@Mapper
public interface CalendarDAO {
	
	public List<CalendarVO> selectScheduleA();
	public List<CalendarVO> selectScheduleD(String memNo);
	public List<CalendarVO> selectScheduleM(String memNo);
	public int insertSchedule(CalendarVO newSchedule);
	public int updateSchedule(CalendarVO modSchedule);
	public int deleteSchedule(String cldrCode);
	
	
}
	
