package kr.or.ddit.student.cyber.lectureevaluation.service;

import java.util.List;

import kr.or.ddit.enumpkg.ServiceResult;
import kr.or.ddit.vo.cyber.LecSurveyContentVO;
import kr.or.ddit.vo.cyber.LecSurveyResultVO;

public interface LecSurveyService {
	
	
	/**
	 * 강의평가 결과 조회
	 * @param lecCode
	 * @param smemNo
	 * @return
	 */
	public LecSurveyResultVO retrieveLSR (String lecCode, String smemNo);
	
	/**
	 * 강의평가 지문
	 * @return
	 */
	public List<LecSurveyContentVO> retrieveLSCList();
	
	/**
	 * 강의평가결과 저장
	 * @param lscList
	 * @return
	 */
	public ServiceResult createLSR(List<LecSurveyContentVO> lscList, String lecCode, String smemNo);
	
	/**
	 * 해당 강의 참여 학생 수
	 * @param lecCode
	 * @return
	 */
	public int evalStudentCount(String lecCode);
	
	/**
	 * [교수용]
	 * 만족도 상세 정보 (평균만족도, 각분류별 만족도)
	 * @param lecCode
	 * @return
	 */
	public LecSurveyResultVO evalAvg(String lecCode);
	
	/**
	 * 해당연도 강의평가 결과 가져옴
	 * @return
	 */
	public LecSurveyResultVO retrieveYearLSR(int year);
	
	/**
	 * 강의평가 기간 여부 확인
	 * @return
	 */
	public boolean lecEvalSeason();
	
	
	
	
	
	
	
	
	
}
