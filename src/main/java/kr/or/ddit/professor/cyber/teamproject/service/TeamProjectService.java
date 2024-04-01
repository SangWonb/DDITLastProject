package kr.or.ddit.professor.cyber.teamproject.service;

import java.util.List;

import kr.or.ddit.enumpkg.ServiceResult;
import kr.or.ddit.vo.cyber.TeamProjectVO;
import kr.or.ddit.vo.cyber.TeamVO;
import kr.or.ddit.vo.user.StudentVO;

public interface TeamProjectService {
	
	/**
	 * 팀플 목록 조회 + 완료율 /(교수용)
	 * @param lecCode
	 * @param tpStatus
	 * @return
	 */
	public List<TeamProjectVO> retrieveTeamProjectList(String lecCode, String tpStatus);
	
	/**
	 * 팀플 목록 조회 + 제출 여부 포함 /(학생용) 
	 * 학번으로 본인 팀 조회
	 * @param lecCode
	 * @param tpStatus
	 * @param smemNo
	 * @return
	 */
	public List<TeamProjectVO> retrieveTeamProjectListS(String lecCode, String tpStatus, String smemNo);
	
	/**
	 * 팀플 상세 조회 + 파일
	 * @param tpNo
	 * @return
	 */
	public TeamProjectVO retrieveTeamProject(String tpNo);
	
	/**
	 * 강의를 듣는 모든 학생의 정보 (팀 구성을 위해)
	 * @param lecCode
	 * @return
	 */
	public List<StudentVO> retrieveAllStudent(String lecCode);
	
	/**
	 * 팀프로젝트 저장(팀플 팀 팀원 변경사항 저장) + 팀플 파일 저장
	 * @param teamProject
	 * @return
	 */
	public ServiceResult modifyTeamProject(TeamProjectVO teamProject);
	
	/**
	 * 팀프로젝트 삭제(임시저장의경우) + 팀프로젝트 del + 팀 del + 팀원 del + 팀플파일
	 * @param tpNo
	 * @return
	 */
	public ServiceResult removeTeamProject(String tpNo);
	
	/**
	 * 팀프로젝트 임시저장(기본 임시저장) + 팀프로젝트 insert + 팀 insert + 팀원 insert + 팀플파일
	 * @param teamProject
	 * @return
	 */
	public ServiceResult createTeamProject(TeamProjectVO teamProject);
	
	/**
	 * 팀프로젝트 저장(파일) + 상태 변경 (++ 업로드 시 gfNo,,File 팀별로 파일 처리)
	 * @param tpNo
	 * @param tpStatus
	 * @return
	 */
	public ServiceResult changeTPStatus(String tpNo, String tpStatus);
	
	/**
	 * 해당 팀플에 대한 팀목록 조회(+ 팀원)
	 * @param tpNo
	 * @return
	 */
	public List<TeamVO> retrieveTeamList(String tpNo);
	
	/**
	 * 팀 제출 상세 조회 + 파일 + 팀원 조회
	 * @param teamNo
	 * @return
	 */
	public TeamVO retrieveTeam(String teamNo);
	
	/**
	 * 팀 제출 파일 수정 + 팀 제출 상태 수정
	 * @param teamNo
	 * @param submitStatus
	 * @return
	 */
	public ServiceResult teamProjectSubmit(TeamVO team);
	
	/**
	 * 팀 평가 (한팀만)
	 * @param team
	 * @return
	 */
	public ServiceResult teamEvaluation(TeamVO team);
	
	
}
