package kr.or.ddit.professor.cyber.grade.dao;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Param;

import kr.or.ddit.student.info.signupclasses.vo.SignUpVO;
import kr.or.ddit.utils.paging.PaginationInfo;
import kr.or.ddit.vo.common.CalendarVO;
import kr.or.ddit.vo.cyber.LecGradeCvtVO;
import kr.or.ddit.vo.cyber.LecturePlanVO;

@Mapper
public interface GradeDAO {
	
	//학생 성적 조회 리스트 + 페이징 처리
	public List<LecGradeCvtVO> selectGradeList(@Param("lecCode") String lecCode, @Param("paging") PaginationInfo paging);
	
	//학생수 구하기
	public int selectTotalRecord (String lecCode);
	
	//해당학생 성적 조회 + 존재 여부확인
	public LecGradeCvtVO selectGrade(@Param("lecCode") String lecCode, @Param("smemNo") String smemNo);
	
	//해당 학생 성적 수정 
	public int updateGrade(LecGradeCvtVO lgc);
	
	//해당 학생 성적 등록
	public int insertGrade(LecGradeCvtVO lgc);
	
	//반영비율 조회(강의계획서)
	public LecturePlanVO selectLecturePlan(String lecCode);
	
	//출결(수업일수 가져오기) attendDAO 사용
	
	//과제 총점 가져오기(완료)
	public int selectAllTaskScore(String lecCode);
	
	//팀플 총점 가져오기(완료)
	public int selectAllTeamProjectScore(String lecCode);
	
	//중간 총점 100
	//기말 총점 100
	
	//해당학생 출석 가져오기 attendDAO 사용
	
	//해당 학생 과제 총점 가져오기
	public int selectAllTaskScoreS(@Param("lecCode") String lecCode, @Param("smemNo") String smemNo);
	
	//해당 학생 팀플 총점 가져오기
	public int selectAllTeamProjectScoreS(@Param("lecCode") String lecCode, @Param("smemNo") String smemNo);
	
	//해당 학생 중간 점수 가져오기
	public int selectMiddleTestScoreS(@Param("lecCode") String lecCode, @Param("smemNo") String smemNo);
	
	//해당 학생 기말 점수 가져오기
	public int selectFinalTestScoreS(@Param("lecCode") String lecCode, @Param("smemNo") String smemNo);
	
	//해당 강의 성적 테이블 모두 지움 >> 잘못 insert, update되면 사용
	public int deleteGrades(String lecCode);
	
	//성적조회 날짜 가져옴(시작날짜/끝날짜)
	public List<CalendarVO> selectGradeDay(SignUpVO signUp);
	
	
	
}
