package kr.or.ddit.student.cyber.lectureevaluation.service;

import java.time.LocalDate;
import java.util.ArrayList;
import java.util.List;

import javax.inject.Inject;

import org.springframework.stereotype.Service;

import kr.or.ddit.enumpkg.ServiceResult;
import kr.or.ddit.student.cyber.lectureevaluation.dao.LecSurveyContentDAO;
import kr.or.ddit.student.cyber.lectureevaluation.dao.LecSurveyResultDAO;
import kr.or.ddit.student.info.signupclasses.vo.SignUpVO;
import kr.or.ddit.vo.common.CalendarVO;
import kr.or.ddit.vo.cyber.LecSurveyContentVO;
import kr.or.ddit.vo.cyber.LecSurveyResultVO;
import lombok.extern.slf4j.Slf4j;

@Slf4j
@Service
public class LecSurveyServiceImpl implements LecSurveyService {
	
	@Inject
	LecSurveyContentDAO lscDao;
	@Inject
	LecSurveyResultDAO lsrDao;
	
	@Override
	public List<LecSurveyContentVO> retrieveLSCList() {
		return lscDao.selectLSCList();
	}

	@Override
	public LecSurveyResultVO retrieveLSR (String lecCode, String smemNo) {
		return lsrDao.selectLSR(lecCode, smemNo);
	}

	@Override
	public ServiceResult createLSR(List<LecSurveyContentVO> lscList, String lecCode, String smemNo) {
		
		int icCount = 0;
		int ccCount = 0;
		int ciCount = 0;
		int tmCount = 0;
		int amCount = 0;
		int allCount = 0;
		
		int icScore = 0;
		int ccScore = 0;
		int ciScore = 0;
		int tmScore = 0;
		int amScore = 0;
		int allScore = 0;
		
		for(LecSurveyContentVO lsc: lscList) {
			switch (lsc.getLsType()) {
			case "IC":
				icCount++;
				icScore += lsc.getSatis();
				break;
			case "CC":
				ccCount++;
				ccScore += lsc.getSatis();
				break;
			case "CI":
				ciCount++;
				ciScore += lsc.getSatis();
				break;
			case "TM":
				tmCount++;
				tmScore += lsc.getSatis();
				break;
			case "AM":
				amCount++;
				amScore += lsc.getSatis();
				break;
			}
		}
		
		allCount = icCount+ccCount+ciCount+tmCount+amCount;
		allScore = icScore+ccScore+ciScore+tmScore+amScore;
		
		LecSurveyResultVO lsr = new LecSurveyResultVO();
		
		lsr.setLsrIc(Math.round(((double) icScore / icCount) * 10.0) / 10.0);
		lsr.setLsrCc(Math.round(((double) ccScore / ccCount) * 10.0) / 10.0);
		lsr.setLsrCi(Math.round(((double) ciScore / ciCount) * 10.0) / 10.0);
		lsr.setLsrTm(Math.round(((double) tmScore / tmCount) * 10.0) / 10.0);
		lsr.setLsrAm(Math.round(((double) amScore / amCount) * 10.0) / 10.0);
		lsr.setLsrTotal(Math.round(((double) allScore / allCount) * 10.0) / 10.0);
		
		lsr.setLecCode(lecCode);
		lsr.setSmemNo(smemNo);
		
		return lsrDao.insertLSR(lsr) > 0 ? ServiceResult.OK:ServiceResult.FAIL;
	}

	@Override
	public int evalStudentCount(String lecCode) {
		return lsrDao.selectLSRList(lecCode).size();
	}

	@Override
	public LecSurveyResultVO evalAvg(String lecCode) {
		
		List<LecSurveyResultVO> lsrList = lsrDao.selectLSRList(lecCode);
		return calculateAverage(lsrList);
	}

	@Override
	public LecSurveyResultVO retrieveYearLSR(int year) {
		
		List<LecSurveyResultVO> yearLSRList = lsrDao.selectALLSRList(year);
		LecSurveyResultVO yearLSR = calculateAverage(yearLSRList);
		
		return yearLSR;
	}
	
	public LecSurveyResultVO calculateAverage(List<LecSurveyResultVO> lsrList) {
		
		int evalStudentCount = lsrList.size();
		
		double icScore = 0.0;
		double ccScore = 0.0;
		double ciScore = 0.0;
		double tmScore = 0.0;
		double amScore = 0.0;
		double allScore = 0.0;
		
		for(LecSurveyResultVO lsr:lsrList) {
			icScore += lsr.getLsrIc();
			ccScore += lsr.getLsrCc();
			ciScore += lsr.getLsrCi();
			tmScore += lsr.getLsrTm();
			amScore += lsr.getLsrAm();
			allScore += lsr.getLsrTotal();
		}
		
		LecSurveyResultVO lsr = new LecSurveyResultVO();
		
		lsr.setLsrIc(Math.round((icScore / evalStudentCount) * 10.0) / 10.0);
		lsr.setLsrCc(Math.round(( ccScore / evalStudentCount) * 10.0) / 10.0);
		lsr.setLsrCi(Math.round(( ciScore / evalStudentCount) * 10.0) / 10.0);
		lsr.setLsrTm(Math.round(( tmScore / evalStudentCount) * 10.0) / 10.0);
		lsr.setLsrAm(Math.round(( amScore / evalStudentCount) * 10.0) / 10.0);
		lsr.setLsrTotal(Math.round(( allScore / evalStudentCount) * 10.0) / 10.0);
		
		return lsr;
	}

	@Override
	public boolean lecEvalSeason() {
		
		LocalDate now = LocalDate.now();
		SignUpVO signUp = settingSemesterAndYear(new SignUpVO());
		List<CalendarVO> lecEvalDayList = lsrDao.selectLecEvalDay(signUp);
		
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
