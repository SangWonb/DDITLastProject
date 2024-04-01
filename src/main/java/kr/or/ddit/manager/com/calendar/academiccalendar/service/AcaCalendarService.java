package kr.or.ddit.manager.com.calendar.academiccalendar.service;

import java.util.List;

import kr.or.ddit.enumpkg.ServiceResult;
import kr.or.ddit.vo.common.CalendarVO;

public interface AcaCalendarService {

	public List<CalendarVO> retrieveAList();
	public ServiceResult addNewInfo(CalendarVO newInfo);
	public ServiceResult modModInfo(CalendarVO modInfo);
	public ServiceResult removeInfo(String cldrCode);
}
