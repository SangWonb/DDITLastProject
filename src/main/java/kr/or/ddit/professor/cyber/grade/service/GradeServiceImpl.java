package kr.or.ddit.professor.cyber.grade.service;

import java.time.LocalDate;
import java.util.ArrayList;
import java.util.List;

import javax.inject.Inject;

import org.springframework.stereotype.Service;

import kr.or.ddit.enumpkg.ServiceResult;
import kr.or.ddit.manager.stu.criteria.attendancecriteria.dao.AttendCriteriaDAO;
import kr.or.ddit.professor.cyber.attendance.dao.AttendDAO;
import kr.or.ddit.professor.cyber.grade.dao.GradeDAO;
import kr.or.ddit.student.info.signupclasses.vo.SignUpVO;
import kr.or.ddit.utils.paging.PaginationInfo;
import kr.or.ddit.vo.common.CalendarVO;
import kr.or.ddit.vo.cyber.LecGradeCvtVO;
import kr.or.ddit.vo.cyber.LecturePlanVO;
import kr.or.ddit.vo.info.AttendCriteriaVO;
import kr.or.ddit.vo.user.StudentVO;
import lombok.extern.slf4j.Slf4j;

@Slf4j
@Service
public class GradeServiceImpl implements GradeService{

	@Inject
	GradeDAO gDao;
	
	@Inject
	AttendDAO aDao;
	
	@Inject
	AttendCriteriaDAO acDao;
	
	@Override
	public List<LecGradeCvtVO> retrieveGradeList(String lecCode, PaginationInfo paging) {
		int totalRecord = gDao.selectTotalRecord(lecCode);
		paging.setTotalRecord(totalRecord);
		return gDao.selectGradeList(lecCode, paging);
	}

	@Override
	public ServiceResult modifyGradeList(String lecCode) {
		
		LecturePlanVO lecturePlan = gDao.selectLecturePlan(lecCode); //배분률
		List<LecGradeCvtVO> lgcList = new ArrayList<LecGradeCvtVO>();
		
		double attendRef = (double) lecturePlan.getLpAttendRef();
		double taskRef = (double) lecturePlan.getLpTaskRef();
		double testRef = (double) lecturePlan.getLpTestRef();
		
		int classCount = aDao.selectClassCount(lecCode); //총 수업일수
		int allTaskScore = gDao.selectAllTaskScore(lecCode);
		int allTeamProjectScore = gDao.selectAllTeamProjectScore(lecCode);
		int taskScore = allTaskScore + allTeamProjectScore; //과제점수(팀플)
		
		//출결기준요건
		double attendanceC = acDao.selectAttendance()/100;
		double absentC = acDao.selectAbsent()/100;
		double lateC = acDao.selectLate()/100;
		double leaveC = acDao.selectLeave()/100;
		double fC = acDao.selectF();
		
		List<StudentVO> studentList = aDao.selectStudentList(lecCode);
		
		int studentCount = studentList.size();
		
		for(StudentVO student : studentList) {
			LecGradeCvtVO lgc = new LecGradeCvtVO();
			lgc.setSmemNo(student.getSmemNo());
			lgc.setMemName(student.getMemName());
			lgc.setDeptName(student.getDeptName());
			lgc.setLecCode(lecCode);
			
			//출결
			double selectAttendance = (double) aDao.selectAttendance(lecCode, student.getSmemNo());
			double selectAbsent = (double) aDao.selectAbsent(lecCode, student.getSmemNo());
			double selectLate = (double) aDao.selectLate(lecCode, student.getSmemNo());
			double selectLeave = (double) aDao.selectLeave(lecCode, student.getSmemNo());
			
			double attendSum = (selectAttendance * attendanceC) + (selectAbsent * absentC) + (selectLate * lateC) + (selectLeave * leaveC);
			double attendDivision = attendSum / (double) classCount;
			double attendFin = attendDivision * attendRef;
			
			//과제(팀플)
			int allTaskScoreS = gDao.selectAllTaskScoreS(lecCode, student.getSmemNo());
			int allTeamProjectScoreS = gDao.selectAllTeamProjectScoreS(lecCode, student.getSmemNo());
			int taskScores = allTaskScoreS + allTeamProjectScoreS;
			double taskDivision = (double)taskScores / (double) taskScore;
			double taskFin = taskDivision * taskRef;
			
			//시험(중간)
			int middleTestScoreS = gDao.selectMiddleTestScoreS(lecCode, student.getSmemNo());
			double middleTestDivision = (double)middleTestScoreS / (double) 100;
			double middleTestFin = (middleTestDivision * testRef) / (double) 2;
			
			//시험(기말)
			int finalTestScoreS = gDao.selectFinalTestScoreS(lecCode, student.getSmemNo());
			double finalTestDivision = (double)finalTestScoreS / (double) 100;
			double finalTestFin = (finalTestDivision * testRef) / (double) 2;
			
			lgc.setLgcAttend((int)attendFin);
			lgc.setLgcTask((int)taskFin);
			lgc.setLgcMidterm((int)middleTestFin);
			lgc.setLgcFinal((int)finalTestFin);
			lgc.setLgcTotalscore((int)(attendFin+taskFin+middleTestFin+finalTestFin));
			
			//등급 계산
			if(lgc.getLgcTotalscore() >= 95) {
				lgc.setLgcGrade("A+");
			}else if(lgc.getLgcTotalscore() >= 90) {
				lgc.setLgcGrade("A");				
			}else if(lgc.getLgcTotalscore() >= 85) {
				lgc.setLgcGrade("B+");								
			}else if(lgc.getLgcTotalscore() >= 80) {
				lgc.setLgcGrade("B");												
			}else if(lgc.getLgcTotalscore() >= 75) {
				lgc.setLgcGrade("C+");																
			}else if(lgc.getLgcTotalscore() >= 70) {
				lgc.setLgcGrade("C");																				
			}else if(lgc.getLgcTotalscore() >= 65) {
				lgc.setLgcGrade("D+");																								
			}else if(lgc.getLgcTotalscore() >= 60) {
				lgc.setLgcGrade("D");																												
			}else {
				lgc.setLgcGrade("F");																																
			}
			
			if(lgc.getLgcAttend() <= retrieveAttendF(lecCode)) {
				lgc.setLgcGrade("F");
			}
			
			//석차 기본 0으로 세팅
			lgc.setLgcRanking(0);
			lgcList.add(lgc);
		}
		
		//석차 계산
		for(LecGradeCvtVO lgc1 : lgcList) {
			 for(LecGradeCvtVO lgc2 : lgcList) {
				 if(lgc1.getLgcTotalscore() <= lgc2.getLgcTotalscore())
					 lgc1.setLgcRanking(lgc1.getLgcRanking() + 1);
			 }
		}
		
		//백분율 계산 후 insert or update
		for(LecGradeCvtVO lgc : lgcList) {
			lgc.setLgcPercent((int)(((double)lgc.getLgcRanking()/(double)studentCount)*(double)100));
			
			if(gDao.selectGrade(lecCode, lgc.getSmemNo()).getLgcCode() == null) {
				//기존에 존재하지 않음 >> insert
				if(gDao.insertGrade(lgc) < 1 ) {
					gDao.deleteGrades(lecCode);
					return ServiceResult.FAIL;
				}
			}else {
				//기존꺼 존재함 >> update
				if(gDao.updateGrade(lgc) < 1 ) {
					gDao.deleteGrades(lecCode);
					return ServiceResult.FAIL;
				}
			}
		}
		return ServiceResult.OK;
	}
	

	@Override
	public LecturePlanVO retrieveLecturePlan(String lecCode) {
		return gDao.selectLecturePlan(lecCode);
	}

	@Override
	public int retrieveAttendF(String lecCode) {
		LecturePlanVO lecturePlan = gDao.selectLecturePlan(lecCode); //배분률
		double attendRef = (double) lecturePlan.getLpAttendRef();
		double fC = acDao.selectF();
		return (int)(fC * attendRef / (double) 100);
	}

	@Override
	public LecGradeCvtVO retrieveGrade(String lecCode, String smemNo) {
		return gDao.selectGrade(lecCode, smemNo);
	}

	@Override
	public LecGradeCvtVO retrieveTest(String lecCode, String smemNo) {
		
		int middleTestScoreS = gDao.selectMiddleTestScoreS(lecCode, smemNo);
		int finalTestScoreS = gDao.selectFinalTestScoreS(lecCode, smemNo);
		
		LecGradeCvtVO lgc = new LecGradeCvtVO();
		lgc.setLgcMidterm(middleTestScoreS);
		lgc.setLgcFinal(finalTestScoreS);
		
		return lgc;
	}

	@Override
	public boolean gradeSeason() {
		
		LocalDate now = LocalDate.now();
		SignUpVO signUp = settingSemesterAndYear(new SignUpVO());
		List<CalendarVO> lecEvalDayList = gDao.selectGradeDay(signUp);
		
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
