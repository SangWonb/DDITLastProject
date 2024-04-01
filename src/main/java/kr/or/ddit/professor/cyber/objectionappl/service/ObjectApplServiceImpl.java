package kr.or.ddit.professor.cyber.objectionappl.service;

import java.time.LocalDate;
import java.util.List;

import javax.inject.Inject;

import org.springframework.stereotype.Service;

import kr.or.ddit.enumpkg.ServiceResult;
import kr.or.ddit.professor.cyber.attendance.dao.AttendDAO;
import kr.or.ddit.professor.cyber.attendance.service.AttendService;
import kr.or.ddit.professor.cyber.objectionappl.dao.ObjectApplDAO;
import kr.or.ddit.professor.cyber.task.dao.TaskDAO;
import kr.or.ddit.professor.cyber.task.service.TaskService;
import kr.or.ddit.professor.cyber.teamproject.dao.TeamProjectDAO;
import kr.or.ddit.professor.cyber.teamproject.service.TeamProjectService;
import kr.or.ddit.student.info.signupclasses.vo.SignUpVO;
import kr.or.ddit.utils.paging.PaginationInfo;
import kr.or.ddit.vo.common.CalendarVO;
import kr.or.ddit.vo.cyber.AttendVO;
import kr.or.ddit.vo.cyber.ComplaintVO;
import kr.or.ddit.vo.cyber.TaskSubmitVO;
import kr.or.ddit.vo.cyber.TaskVO;
import kr.or.ddit.vo.cyber.TeamProjectVO;
import kr.or.ddit.vo.cyber.TeamVO;

@Service
public class ObjectApplServiceImpl implements ObjectApplService{
	
	@Inject
	ObjectApplDAO oDao;
	
	@Override
	public List<ComplaintVO> retrieveComListP(String lecCode, PaginationInfo paging) {
		int totalRecord = oDao.totalRecord(lecCode);
		paging.setTotalRecord(totalRecord);
		return oDao.comListP(lecCode, paging);
	}

	@Override
	public List<ComplaintVO> retrieveComListS(String lecCode, String smemNo) {
		return oDao.comListS(lecCode, smemNo);
	}

	@Override
	public ComplaintVO retrieveCom(String cptNo) {
		return oDao.selectCom(cptNo);
	}

	@Override
	public ServiceResult createCom(ComplaintVO com) {
		return oDao.comInsert(com) > 0 ? ServiceResult.OK:ServiceResult.FAIL;
	}

	@Override
	public ServiceResult modifyCom(ComplaintVO com) {
		return oDao.comUpdate(com) > 0 ? ServiceResult.OK:ServiceResult.FAIL;
	}

	@Override
	public ServiceResult removeCom(String cptNo) {
		return oDao.comDelete(cptNo) > 0 ? ServiceResult.OK:ServiceResult.FAIL;
	}

	@Override
	public boolean objectApplSeason() {
		LocalDate now = LocalDate.now();
		SignUpVO signUp = settingSemesterAndYear(new SignUpVO());
		List<CalendarVO> lecEvalDayList = oDao.selectObjectApplDay(signUp);
		
		for(CalendarVO cal :lecEvalDayList) {
			LocalDate cldrStart = cal.getCldrStart();
			LocalDate cldrEnd = cal.getCldrEnd();
			if(now.isBefore(cldrStart) || now.isAfter(cldrEnd)) {
			}else {
				return true;
			}
		}
		
		return false;
	}

	/**
	 * 오늘날의 년도와 학기를 계산해서 넣어줌
	 * @param signUp
	 * @return
	 */
	public SignUpVO settingSemesterAndYear(SignUpVO signUp) {
		
		int year = LocalDate.now().getYear();
		int month = LocalDate.now().getMonthValue();
		String currentSemester = null;
		switch (month) {
		case 1:case 2:case 3:case 4:case 5:case 6:
			currentSemester = "1학기";
			break;
		default:
			currentSemester = "2학기";
			break;
		}
		signUp.setYear(year);
		signUp.setSemester(currentSemester);
		
		return signUp;
	}
}
