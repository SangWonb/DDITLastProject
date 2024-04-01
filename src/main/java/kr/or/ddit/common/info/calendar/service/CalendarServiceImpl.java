package kr.or.ddit.common.info.calendar.service;

import java.util.List;

import javax.inject.Inject;

import org.springframework.stereotype.Service;

import kr.or.ddit.common.info.calendar.dao.CalendarDAO;
import kr.or.ddit.enumpkg.ServiceResult;
import kr.or.ddit.vo.common.CalendarVO;
import kr.or.ddit.vo.user.MemberVO;
import lombok.extern.slf4j.Slf4j;

@Slf4j
@Service
public class CalendarServiceImpl implements CalendarService{

	@Inject
	private CalendarDAO dao;
	
	@Override
	public List<CalendarVO> retrieveScheduleSaved(MemberVO mem) {
		String memNo = mem.getMemNo();
		String memSche = mem.getMemSchedule();
		
		log.info(memSche);
		
		List<CalendarVO> resultM = dao.selectScheduleM(memNo);
		
		if(memSche!=null) {
			switch (memSche) {
			case "a":
				resultM.addAll(dao.selectScheduleA());
				break;
			case "d":
				resultM.addAll(dao.selectScheduleD(memNo));
				break;
			case "ad":
				resultM.addAll(dao.selectScheduleA());
				resultM.addAll(dao.selectScheduleD(memNo));
				break;
			default :
				break;
			}
		}
		return resultM;
	}
	
	@Override
	public List<CalendarVO> retrieveScheduleA() {
		return dao.selectScheduleA();
	}
	
	@Override
	public List<CalendarVO> retrieveScheduleD(String memNo) {
		return dao.selectScheduleD(memNo);
	}
	
	@Override
	public List<CalendarVO> retrieveScheduleM(String memNo) {
		return dao.selectScheduleM(memNo);
	}

	@Override
	public ServiceResult addSchedule(CalendarVO newSchedule) {
		return dao.insertSchedule(newSchedule)>0?ServiceResult.OK:ServiceResult.FAIL;
	}

	@Override
	public ServiceResult modSchedule(CalendarVO modSchedule) {
		return dao.updateSchedule(modSchedule)>0?ServiceResult.OK:ServiceResult.FAIL;
	}

	@Override
	public ServiceResult removeSchedule(String cldrCode) {
		return dao.deleteSchedule(cldrCode)>0?ServiceResult.OK:ServiceResult.FAIL;
	}




}
