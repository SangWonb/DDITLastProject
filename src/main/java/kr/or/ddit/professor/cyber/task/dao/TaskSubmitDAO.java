package kr.or.ddit.professor.cyber.task.dao;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Param;

import kr.or.ddit.vo.cyber.TaskSubmitVO;

@Mapper
public interface TaskSubmitDAO {
	
	//목록 조회
	public List<TaskSubmitVO> selectTaskSubmitList(String taskCode);
	
	//상세조회 + 파일
	public TaskSubmitVO selectTaskSubmit(@Param("taskCode") String taskCode,@Param("smemNo") String smemNo);
	
	//과제 업로드 시 (학생별로 과제제출 테이블 insert) // gfNo 만들어야함
	public int insertTaskSubmit(TaskSubmitVO taskSubmit);
	
	//과제 평가
	public int taskEvaluation(TaskSubmitVO taskSubmit);
	
	//과제저장 : file update
	
	//과제제출  update
	public int taskSubmit(@Param("taskCode") String taskCode, @Param("smemNo") String smemNo, @Param("submitStatus") String submitStatus);
	
	//과제 평가미완 개수
	public int taskNotEvaluationCount (String taskCode);
	
	//이의신청 반영
	public int updateTaskSubmitScore(TaskSubmitVO taskSubmit);
}
