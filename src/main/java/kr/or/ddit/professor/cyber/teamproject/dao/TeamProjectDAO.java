package kr.or.ddit.professor.cyber.teamproject.dao;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Param;

import kr.or.ddit.vo.cyber.TeamProjectVO;
import kr.or.ddit.vo.user.StudentVO;

@Mapper
public interface TeamProjectDAO {

	//팀프로젝트 목록 조회
	public List<TeamProjectVO> selectTeamProjectList(@Param("lecCode") String lecCode,@Param("tpStatus") String tpStatus);
	
	//팀프로젝트 목록 조회 (학생용)팀단위 조회 제출 미제출 여부 표현
	public List<TeamProjectVO> selectTeamProjectListS(@Param("lecCode") String lecCode,@Param("tpStatus") String tpStatus, @Param("smemNo") String smemNo);
	
	//할당해야할 학생 정보 구하기
	public List<StudentVO> selectAllStudent(String lecCode);
	
	//할당된 전체 팀 수 구하기
	public int selectAllTeamCount(String tpNo);
	
	//제출한 팀 수 구하기
	public int selectCompletion(String tpNo);
	
	//팀프로젝트 상세조회 + 파일
	public TeamProjectVO selectTeamProject(String tpNo);
	
	//수정(임시저장) + *팀프로젝트*  + 팀 + 팀원 테이블 저장
	public int updateTeamProject (TeamProjectVO teamProject);
	
	//삭제(임시저장) +파일도 + *팀프로젝트*  + 팀 + 팀원 테이블 삭제
	public int deleteTeamProject (String tpNo);
	
	//첫등록 (팀프로젝트) >> TeamDAO.team 등록/ team Member 등록
	public int insertTeamProject (TeamProjectVO teamProject);
	
	//업로드 팀프로젝트 상태 변경 //업로드시 팀별로 gfNo 추가 하기
	public int changeTeamProjectStatus(@Param("tpNo") String tpNo,@Param("tpStatus") String tpStatus);
	
	//teamProject Max tpNo 구하는내용
	public String MaxTpNo();
	
	//시연용 진행>평가 상태변경
	public int tpEval(String lecCode);
	
	
}
