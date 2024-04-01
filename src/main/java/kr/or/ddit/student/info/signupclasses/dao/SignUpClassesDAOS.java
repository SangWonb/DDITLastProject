package kr.or.ddit.student.info.signupclasses.dao;

import java.time.LocalDate;
import java.util.List;

import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Param;

import kr.or.ddit.enumpkg.ServiceResult;
import kr.or.ddit.student.info.signupclasses.vo.SignUpVO;
import kr.or.ddit.utils.abMapper.AbstractCommonMapper;
import kr.or.ddit.vo.common.CalendarVO;
import kr.or.ddit.vo.cyber.DepartmentVO;
import kr.or.ddit.vo.cyber.LectureApplyVO;
import kr.or.ddit.vo.cyber.LectureVO;
import kr.or.ddit.vo.cyber.RegistrationVO;
import kr.or.ddit.vo.cyber.SubjectVO;
import kr.or.ddit.vo.user.StudentVO;

@Mapper
public interface SignUpClassesDAOS {
	
	//수강신청 날짜 가져옴(시작날짜/끝날짜)
	public List<CalendarVO> selectSignUpDay(SignUpVO signUp);
	
	//학생정보 가져옴
	public StudentVO selectStudentInfo(String smemNo);
	
	//신청 가능한 강의 목록 조회함
	public List<LectureVO> selectLecListForSignUpClasses(SignUpVO signUp);
	
	//해당 강의의 신청 인원 구하기
	public int lecSignUpCount(String lecCode);
	
	//신청한 강의 목록 조회함
	public List<LectureVO> selectLecListChoose(SignUpVO signUp);
	
	//신청한 강의 학점 총합 조회함
	public int selectChooseCredit(SignUpVO signUp);
	
	//수강신청
	public int insertRegistration(RegistrationVO regi);
	
	//수강신청 취소
	public int deleteRegistration(@Param("smemNo") String smemNo,@Param("lecCode") String lecCode);
	
	//직접 수강신청시 주의 >> 해당 강의가 현재 신청할 수 있는 강의인지 확인 + 존재하는지//존재하면 1
	public int existLecture(SignUpVO signUp);
	
	//선택하는 강의 조회(마감여부 등등 확인을 위해서)
	public LectureVO retrieveLectureInfo (SignUpVO signUp);
	
	/**
	 * 중복신청 여부
	 * @param smemNo
	 * @param lecCode
	 * @return
	 */
	public int hasRegistration(@Param("smemNo") String smemNo,@Param("lecCode") String lecCode);
	
	public List<String> signUpedLecCode(@Param("smemNo") String smemNo,@Param("signUp") SignUpVO signUp);
}

