package kr.or.ddit.professor.cyber.attendance.dao;

import java.time.LocalDate;
import java.util.List;

import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Param;

import kr.or.ddit.professor.cyber.attendance.vo.AttendInfoVO;
import kr.or.ddit.student.info.signupclasses.vo.SignUpVO;
import kr.or.ddit.vo.cyber.AttendVO;
import kr.or.ddit.vo.cyber.LectureTimeVO;
import kr.or.ddit.vo.user.StudentVO;

@Mapper
public interface AttendDAO {
	
	//해당 학생의 결석 일수 구하기
	public int selectAbsent(@Param("lecCode") String lecCode, @Param("smemNo") String smemNo);
	
	//해당 학생의 조퇴 일수 구하기
	public int selectLeave(@Param("lecCode") String lecCode, @Param("smemNo") String smemNo);
	
	//해당 학생의 지각 일수 구하기
	public int selectLate(@Param("lecCode") String lecCode, @Param("smemNo") String smemNo);
	
	//해당 학생의 출석 일수 구하기(출석 + 공결)
	public int selectAttendance(@Param("lecCode") String lecCode, @Param("smemNo") String smemNo);
	
	//해당 강의의 일자 구하기
	public String selectLectureDate(String lecCode);
	
	//개강일자 구하기
//	public String selectStartDate(@Param("startSemester") String startSemester, @Param("endSemester") String endSemester);
	public String selectStartDate(SignUpVO signUp);
	
	//해당 강의 요일 구하기
	public List<LectureTimeVO> selectDayList(String lecCode);
	
	//해당 강의 수업일수 구하기
	public int selectClassCount(String lecCode);
	
	//해당 강의 듣는 학생 리스트 가져오기 //학번 순서
	public List<StudentVO> selectStudentList(String lecCode);

	//해당 강의, 해당 학생, 해당 날짜의 출석 조회
	public AttendVO selectAttend(AttendVO attend);
	
	//출석 업데이트
	public int updateAttend(AttendVO attend);
	
	//출석 입력
	public int insertAttend(AttendVO attend);
	
	public AttendVO selectAttendPK(String atNo);
	
	public int updateAttendPk(AttendVO attend);
}
