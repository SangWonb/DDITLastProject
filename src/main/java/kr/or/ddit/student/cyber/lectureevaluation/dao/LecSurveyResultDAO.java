package kr.or.ddit.student.cyber.lectureevaluation.dao;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Param;

import kr.or.ddit.student.info.signupclasses.vo.SignUpVO;
import kr.or.ddit.vo.common.CalendarVO;
import kr.or.ddit.vo.cyber.LecSurveyResultVO;

@Mapper
public interface LecSurveyResultDAO {
	
	public LecSurveyResultVO selectLSR(@Param("lecCode") String lecCode, @Param("smemNo") String smemNo);
	
	public List<LecSurveyResultVO> selectLSRList(String lecCode);
	
	public int insertLSR(LecSurveyResultVO lsr);
	
	public List<LecSurveyResultVO> selectALLSRList(int year);
	
	//강의평가 날짜 가져옴(시작날짜/끝날짜)
	public List<CalendarVO> selectLecEvalDay(SignUpVO signUp);
	
}
