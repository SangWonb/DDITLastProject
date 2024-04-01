package kr.or.ddit.student.info.signupclasses.service;

import java.util.List;
import java.util.Map;

import kr.or.ddit.enumpkg.ServiceResult;
import kr.or.ddit.student.info.signupclasses.vo.SignUpVO;
import kr.or.ddit.vo.common.CalendarVO;
import kr.or.ddit.vo.cyber.DepartmentVO;
import kr.or.ddit.vo.cyber.LectureApplyVO;
import kr.or.ddit.vo.cyber.LectureVO;
import kr.or.ddit.vo.cyber.SubjectVO;
import kr.or.ddit.vo.user.StudentVO;

public interface SignUpClassesService {
	
	/**
	 * 현재가 수강신청 기간인지 확인(접근 제한)
	 * @return
	 */
	public boolean singUpSeason();
	
	/**
	 * 해당하는 년도와 학기의 수강신청 기간을 가져옴
	 * @param year
	 * @param semester
	 * @return
	 */
	public List<CalendarVO> retrieveSignUpDaty();
	
	/**
	 * 학생의 정보를 가져옴
	 * @param smemNo
	 * @return
	 */
	public StudentVO retrieveStudentInfo(String smemNo);
	
	/**
	 * 신청 가능한 강의 목록 조회 (+ 검색조건)
	 * 조건)
	 * 1. 해당 년도와 학기의 강의인지
	 * 2. 검색조건에 맞는지
	 * @param smemNo
	 * @return
	 */
	public List<LectureVO> retrieveLecListForSignUpClasses(StudentVO student, SignUpVO signUp);
	
	/**
	 * 신청한 강의 목록 조회
	 * @param smemNo
	 * @return
	 */
	public List<LectureVO> retrieveLecListChoose(String smemNo);
	
	/**
	 * 수강신청
	 * 조건)
	 * 1.제한학점 초과 여부(18학점) OVERFLOW
	 * 2.기존 신청 강의 시간과의 충돌 여부확인 CRASH
	 * 3.수강인원 마감 여부 FINISH
	 * 4.중복신청 여부 PKDUPLICATED
	 * 5.존재여부 NOTEXIST
	 * @param smemNo
	 * @param lecCode
	 * @return
	 */
	public ServiceResult signUpClasses(String smemNo, String lecCode);
	
	/**
	 * 수강신청취소
	 * @param smemNo
	 * @param lecCode
	 * @return
	 */
	public ServiceResult singnUpClassesCancle(String smemNo, String lecCode);
	
	/**
	 * 선택한 학점들 총합
	 * @param smemNo
	 * @return
	 */
	public int retrieveChooseAllCredit(String smemNo);
	
	public Map<String, Integer> timeChange(String ltvo);
	
	public List<String> signUpedLecCode(String smemNo);
	
}
