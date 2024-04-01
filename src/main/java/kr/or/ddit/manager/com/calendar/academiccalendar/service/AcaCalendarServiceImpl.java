package kr.or.ddit.manager.com.calendar.academiccalendar.service;

import java.util.List;

import javax.inject.Inject;

import org.springframework.stereotype.Service;

import kr.or.ddit.enumpkg.ServiceResult;
import kr.or.ddit.manager.com.calendar.academiccalendar.dao.AcaCalendarDAO;
import kr.or.ddit.vo.common.CalendarVO;

@Service
public class AcaCalendarServiceImpl implements AcaCalendarService {

	@Inject
	private AcaCalendarDAO dao;
	
	@Override
	public ServiceResult addNewInfo(CalendarVO newInfo) {
		return dao.insertNewInfo(newInfo)>0?ServiceResult.OK: ServiceResult.FAIL;
	}

	@Override
	public ServiceResult modModInfo(CalendarVO modInfo) {
		return dao.updateModInfo(modInfo)>0?ServiceResult.OK: ServiceResult.FAIL;
	}

	@Override
	public ServiceResult removeInfo(String cldrCode) {
		return dao.deleteInfo(cldrCode)>0?ServiceResult.OK: ServiceResult.FAIL;
	}

	@Override
	public List<CalendarVO> retrieveAList() {
		return dao.selectAList();
				
	}

}
