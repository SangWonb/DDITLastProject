package kr.or.ddit.professor.cyber.grade.service;

import java.util.List;

import kr.or.ddit.enumpkg.ServiceResult;
import kr.or.ddit.utils.paging.PaginationInfo;
import kr.or.ddit.vo.cyber.LecGradeCvtVO;
import kr.or.ddit.vo.cyber.LecturePlanVO;

public interface GradeService {
	
	//해당 강의 듣는 학생 리스트 가져오기 + 성적 조회 >> 성적 산출 x, 학생정보만 보임
	public List<LecGradeCvtVO> retrieveGradeList (String lecCode, PaginationInfo paging);
	
	//해당 강의의 성적 업데이트 (학생 전체)
	public ServiceResult modifyGradeList (String lecCode );
	
	//해당 반영비율 구하기(기준점수)
	public LecturePlanVO retrieveLecturePlan(String lecCode);
	
	//출결 F
	public int retrieveAttendF(String lecCode);
	
	//한 학생 성적 조회
	public LecGradeCvtVO retrieveGrade(String lecCode, String smemNo);
	
	//중간/기말 성적 가져오기 100점 만점으로 
	public LecGradeCvtVO retrieveTest(String lecCode, String smemNo);
	
	/**
	 * 성적조회 기간 여부 확인
	 * @return
	 */
	public boolean gradeSeason();
	
}
