package kr.or.ddit.student.info.signupclasses.service;

import java.time.LocalDate;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.inject.Inject;

import org.apache.commons.lang3.StringUtils;
import org.springframework.stereotype.Service;

import kr.or.ddit.enumpkg.ServiceResult;
import kr.or.ddit.student.info.signupclasses.dao.SignUpClassesDAOS;
import kr.or.ddit.student.info.signupclasses.vo.SignUpVO;
import kr.or.ddit.vo.common.CalendarVO;
import kr.or.ddit.vo.cyber.DepartmentVO;
import kr.or.ddit.vo.cyber.LectureApplyVO;
import kr.or.ddit.vo.cyber.LectureTimeVO;
import kr.or.ddit.vo.cyber.LectureVO;
import kr.or.ddit.vo.cyber.RegistrationVO;
import kr.or.ddit.vo.cyber.SubjectVO;
import kr.or.ddit.vo.user.StudentVO;
import lombok.extern.slf4j.Slf4j;

@Slf4j
@Service
public class SignUpClassesServiceImplS implements SignUpClassesService {
	
	@Inject
	SignUpClassesDAOS dao;
	
	@Override
	public StudentVO retrieveStudentInfo(String smemNo) {
		StudentVO studentInfo = dao.selectStudentInfo(smemNo);
		studentInfo.setGrade(studentGrade(studentInfo.getSmemSemester()));
		return studentInfo;
	}

	@Override
	public List<LectureVO> retrieveLecListForSignUpClasses(StudentVO student, SignUpVO signUp) {
		
		//소속학과를 선택한 경우 해당 학년의 강의만 보여짐
		StudentVO studentInfo = dao.selectStudentInfo(student.getSmemNo());
		String studentGrade = studentGrade(studentInfo.getSmemSemester());
		
		signUp.setDeptCode(student.getDeptCode());
		SignUpVO signUpvo = settingSemesterAndYear(signUp);
		signUpvo.setSchoolYear(studentGrade+"학년");
		
		List<LectureVO> signUpClasses = dao.selectLecListForSignUpClasses(signUpvo);
		
		for(LectureVO lec : signUpClasses) {
			int count = dao.lecSignUpCount(lec.getLecCode());
			lec.setLecSignUp(count);
			lec.setLectureTime(transLecTime(lec.getLecTimeList()));
		}
		
		return signUpClasses;
	}

	@Override
	public List<LectureVO> retrieveLecListChoose(String smemNo) {
		
		SignUpVO signUp = settingSemesterAndYear(new SignUpVO());
		signUp.setSmemNo(smemNo);
		
		return dao.selectLecListChoose(signUp);
	}

	@Override
	public ServiceResult signUpClasses(String smemNo, String lecCode) {
		
		RegistrationVO regi = new RegistrationVO();
		regi.setLecCode(lecCode);
		regi.setSmemNo(smemNo);
		
		
		SignUpVO signUp = settingSemesterAndYear(new SignUpVO());
		signUp.setSmemNo(smemNo);
		signUp.setLecCode(lecCode);
		
		//제한학점 초과 여부(18학점)
		if( dao.selectChooseCredit(signUp) > 18) return ServiceResult.OVERFLOW;
		
		//해당 강의 존재 여부
		if( dao.existLecture(signUp) < 1) return ServiceResult.NOTEXIST;
		
		//중복 신청 여부
		if( dao.hasRegistration(smemNo, lecCode) != 0) return ServiceResult.PKDUPLICATED;
				
		//인원초과 여부
		LectureVO lectureInfo = dao.retrieveLectureInfo(signUp);
		int signUpCount = dao.lecSignUpCount(lecCode);
		if(lectureInfo.getLolLimit() <= signUpCount) return ServiceResult.FINISH;
		
		//겹치는지 여부
		List<LectureVO> lecListChoose = dao.selectLecListChoose(signUp); //기존의 수강신청 내역
		List<LectureTimeVO> lecTimeList = lectureInfo.getLecTimeList(); //새로 신청하려고 하는 강의 시간 목록
		
		for(LectureTimeVO newLecTime :lecTimeList) {
			for(LectureVO lecList:lecListChoose) {
				for(LectureTimeVO oldLecTime:lecList.getLecTimeList()) {
					if(newLecTime.getLtDay().equals(oldLecTime.getLtDay())) {
						
						//기존 시간표와 요일이 같은경우!
						int newStart = Integer.parseInt(newLecTime.getLtTime().substring(0,4));
						int newEnd = Integer.parseInt(newLecTime.getLtTime().substring(4,8));
						int oldStart = Integer.parseInt(oldLecTime.getLtTime().substring(0,4));
						int oldEnd = Integer.parseInt(oldLecTime.getLtTime().substring(4,8));
						
						if(newStart < oldStart) {
						//새로신청할 강의가 기존강의보다 먼저시작할 경우
							//기존시간꺼 시작전에 신규시나이 끝나야함
							if(newEnd > oldStart) {
								return ServiceResult.CRASH;
							}
						}else if(newStart > oldStart) {
						//새로신청한 강의가 기존의 강의보다 늦게 시작할 경우
							if(oldEnd > newStart) {
								return ServiceResult.CRASH;
							}
						}else if(newStart == oldStart) {
						//새로 신청한 강의가 기존 강의와 같은 시간에 시작할 경우
							return ServiceResult.CRASH;
						}
					}
				}
			}
		}
		
		return dao.insertRegistration(regi) > 0 ? ServiceResult.OK:ServiceResult.FAIL;
	}

	@Override
	public ServiceResult singnUpClassesCancle(String smemNo, String lecCode) {
		return dao.deleteRegistration(smemNo, lecCode) > 0 ? ServiceResult.OK:ServiceResult.FAIL;
	}

	@Override
	public boolean singUpSeason() {
		
		LocalDate now = LocalDate.now();
		List<CalendarVO> signUpDatyList = retrieveSignUpDaty();
		
		for(CalendarVO cal :signUpDatyList) {
			LocalDate cldrStart = cal.getCldrStart();
			LocalDate cldrEnd = cal.getCldrEnd();
			if(now.isBefore(cldrStart) || now.isAfter(cldrEnd)) {
			}else {
				return true;
			}
		}
		
		return false;
	}

	@Override
	public List<CalendarVO> retrieveSignUpDaty() {
		SignUpVO signUp = settingSemesterAndYear(new SignUpVO());
		return dao.selectSignUpDay(signUp);
	}
	
	@Override
	public int retrieveChooseAllCredit(String smemNo) {
		SignUpVO signUp = settingSemesterAndYear(new SignUpVO());
		signUp.setSmemNo(smemNo);
		
		return dao.selectChooseCredit(signUp);
	}
	
	@Override
	public List<String> signUpedLecCode(String smemNo) {
		SignUpVO signUp = settingSemesterAndYear(new SignUpVO());
		return dao.signUpedLecCode(smemNo, signUp);
	}
	
	/**
	 * 1,2학기 >> 1학년
	 * 3,4학기 >> 2학년
	 * 5,6학기 >> 3학년
	 * 7이상 >> 4학년
	 * @param smemSemester
	 * @return
	 */
	public String studentGrade(String smemSemester) {
		
		String grade = null;
		
		if(smemSemester.equals("1학기") || smemSemester.equals("2학기")) {grade = "1";}
		else if (smemSemester.equals("3학기") || smemSemester.equals("4학기")) {grade = "2";}
		else if (smemSemester.equals("5학기") || smemSemester.equals("6학기")) {grade = "3";}
		else {grade = "4";}
		
		return grade;
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
	
	public String transLecTime(List<LectureTimeVO> lecTimeList) {
		
		String timeFormat = "";
		
		for(LectureTimeVO lecTime : lecTimeList) {
			
			log.info("\n\n\n\n==== lecTime =====\n{}\n\n\n",lecTime);
			
			String ltDay = lecTime.getLtDay();
			String time = lecTime.getLtTime();
			
			
			String day = "";
				switch (ltDay) {
				case "1": day = "월"; break;
				case "2": day = "화"; break;
				case "3": day = "수"; break;
				case "4": day = "목"; break;
				case "5": day = "금"; break;
			}
			log.info("\n\n\n\n==== ltDay =====\n{}\n\n\n",ltDay);
			log.info("\n\n\n\n==== time =====\n{}\n\n\n",time);
			log.info("\n\n\n\n==== day =====\n{}\n\n\n",day);

			timeFormat += "[" + day + "|" + time.substring(0,2) + ":" + time.substring(2,4) + "~" + time.substring(4,6) + ":" + time.substring(6,8) + "]";
		}
		
		return timeFormat;
	}
	
	//10101210 >> 몇시사작 ~ 몇시간 몇분 수업인지
	//rowspan 설정
	@Override
	public Map<String, Integer> timeChange(String ltvo) {
		// 1시간 = 30*2 = 2칸
		// 30분 = 1칸
		
		// 시작 index
		// 수업 시간
		
		int startH = Integer.parseInt(StringUtils.substring(ltvo, 0, 2)); 
		int startM = Integer.parseInt(StringUtils.substring(ltvo, 2, 4)); 
		int endH = Integer.parseInt(StringUtils.substring(ltvo, 4, 6)); 
		int endM = Integer.parseInt(StringUtils.substring(ltvo, 6, 8)); 
		
		int start = ((startH - 9) * 2) + (startM/30) + 1;
		
		int seH = 0;
		int seM = 0;
		if(startM < endM) {
			seH = ((endH - startH) * 2);
			seM = (endM-startM)/30;
		}else {
			seH = ((endH - startH -1) * 2);
			seM = ((60 - startM) + endM)/30;
		}
		
		int timeNum = seH + seM;
		
		Map<String, Integer> timeInfo = new HashMap<String, Integer>();
		timeInfo.put("start", start);
		timeInfo.put("timeNum", timeNum);
		
		return timeInfo;
	}

}
