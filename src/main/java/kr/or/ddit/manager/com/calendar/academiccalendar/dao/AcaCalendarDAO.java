package kr.or.ddit.manager.com.calendar.academiccalendar.dao;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;

import kr.or.ddit.vo.common.CalendarVO;

@Mapper
public interface AcaCalendarDAO {

	public List<CalendarVO> selectAList();
	public int insertNewInfo(CalendarVO newInfo);
	public int updateModInfo(CalendarVO modInfo);
	public int deleteInfo(String cldrCode);
}
