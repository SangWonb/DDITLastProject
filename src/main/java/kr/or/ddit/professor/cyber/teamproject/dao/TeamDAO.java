package kr.or.ddit.professor.cyber.teamproject.dao;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Param;

import kr.or.ddit.vo.cyber.TeamMemberVO;
import kr.or.ddit.vo.cyber.TeamVO;
import kr.or.ddit.vo.user.StudentVO;

@Mapper
public interface TeamDAO {
	
	//팀 목록 조회 + 팀원
	public List<TeamVO> selectTeamList(String tpNo);
	
	//팀 제출 상세조회 + 파일 + 팀원 조회
	public TeamVO selectTeam(@Param("teamNo") String teamNo);
	
	//프로젝트 임시 저장 시 팀 테이블 insert
	public int insertTeam(TeamVO team);
	
	//프로젝트 임시 저장 시 팀원 테이블 insert
	public int insertTeamMember(@Param("teamNo") String teamNo, @Param("smemNo") String smemNo);
	
	//프로젝트 업로드 시 gfNo 추가 update
	public int uploadAddGfNoTeam(@Param("teamNo") String teamNo, @Param("gfNo") String gfNo);
	
	//프로젝트 제출 상태 변경 update
	public int teamProjectSubmit(@Param("teamNo") String teamNo, @Param("submitStatus") String submitStatus);
	
	//프로젝트 삭제 시 팀 테이블 delete + 파일도 >> 해야함
	public int deleteTeam(String tpNo);
	
	//프로젝트 삭제 시 팀원 테이블 delete
	public int deleteTeamMember(String teamNo);
	
	//프로젝트 평가 미완 개수
	public int teamProjectNotEvaluationCount(String tpNo);
	
	//팀 평가 하기
	public int teamEvalution(TeamVO team);
	
	//학번을 보고 해당하는 팀번호 찾기(상세조회시 사용)
	public String findTeam(@Param("tpNo") String tpNo,@Param("smemNo") String smemNo);
	
	//team Max teamNo 구하는내용
	public String maxTeamNo();
	
	//이의신청 점수 수정용
	public int updateTeamSocre(TeamVO team);
	
}
