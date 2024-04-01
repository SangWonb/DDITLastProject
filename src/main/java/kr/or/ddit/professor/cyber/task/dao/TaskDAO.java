package kr.or.ddit.professor.cyber.task.dao;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Param;

import kr.or.ddit.professor.cyber.task.vo.ProgressStatusVO;
import kr.or.ddit.vo.cyber.TaskSubmitVO;
import kr.or.ddit.vo.cyber.TaskVO;
import kr.or.ddit.vo.user.StudentVO;
import okhttp3.internal.concurrent.Task;

@Mapper
public interface TaskDAO {
	
	//목록 조회 교수용
	public List<TaskVO> selectTaskList(@Param("lecCode") String lecCode,@Param("taskStatus") String taskStatus);
	
	//목록 조회 학생용(제출 미제출 여부 표현)
	public List<TaskVO> selectTaskListS(@Param("lecCode") String lecCode,@Param("taskStatus") String taskStatus, @Param("smemNo") String smemNo);
	
	//할당해야할 학생 정보 구하시
	public List<StudentVO> selectAllStudent(String taskCode);
	
	//할당된 전체 수 구하기
	public int selectAllCount(String taskCode);
	
	//제출 한 수 구하기
	public int selectCompletion(String taskCode);
	
	//상세조회 + 파일
	public TaskVO selectTask(String taskCode);
	
	//수정(임시저장)
	public int updateTask(TaskVO task);
	
	//삭제(임시저장)
	public int deleteTask(String taskCode);
	
	//등록
	public int insertTask(TaskVO task);
	
	//업로드/평가/완료로 상태 변경 update(taskStatus) + taskSubmit에서(과제제출테이블 insert)
	public int uploadTask(@Param("taskCode") String taskCode,@Param("taskStatus") String taskStatus);
	
	//시연용 진행>평가 상태변경
	public int taskEval(String lecCode);
	
}
 