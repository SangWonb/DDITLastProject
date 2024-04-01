package kr.or.ddit.professor.cyber.task.service;

import java.util.List;

import org.apache.ibatis.annotations.Param;

import kr.or.ddit.enumpkg.ServiceResult;
import kr.or.ddit.vo.cyber.TaskSubmitVO;
import kr.or.ddit.vo.cyber.TaskVO;

public interface TaskService {
	
	/**
	 * 과제 목록 조회 + 완료율 /교수용
	 * @param lecCode
	 * @param taskStatus
	 * @return
	 */
	public List<TaskVO> retrieveTaskList(String lecCode, String taskStatus);
	
	/**
	 * 과제 목록 조회 학생용 /제출 여부 포함
	 * @param lecCode
	 * @param taskStatus
	 * @param smemNo
	 * @return
	 */
	public List<TaskVO> retrieveTaskListS(String lecCode, String taskStatus, String smemNo);
	
	/**
	 * 과제 상세 조회 + 파일 
	 * @param taskCode
	 * @return
	 */
	public TaskVO retrieveTask(String taskCode);
	
	
	/**
	 * 과제 수정 (file 수정)
	 * @param task
	 * @return
	 */
	public ServiceResult modifyTask(TaskVO task);
	
	/**
	 * 과제 삭제 (과제 db + 해당하는 gfNo 폴더 삭제)
	 * @param taskCode
	 * @return
	 */
	public ServiceResult removeTask(String taskCode);
	
	/**
	 * 과제 등록 (기본적으로 임시저장)
	 * @param task
	 * @return
	 */
	public ServiceResult createTask(TaskVO task);
	
	/**
	 * 과제 제출 목록 조회
	 * @param taskCode
	 * @return
	 */
	public List<TaskSubmitVO> retrieveTaskSubmitList(String taskCode);
	
	/**
	 * 과제 제출 상세 조회 + 파일
	 * @param taskCode
	 * @param smemNo
	 * @return
	 */
	public TaskSubmitVO retrieveTaskSubmit(String taskCode, String smemNo);
	
	/**
	 * 업로드/평가/완료로 상태 변경
	 * 업로드 시 모든 학생들에 대해서 과제 제출 테이블, gfNo 테이블 insert
	 * @param taskCode
	 * @param taskStatus
	 * @return
	 */
	public ServiceResult uploadTask(String taskCode, String taskStatus);
	
	/**
	 * 과제 평가(채점)
	 * @param taskSubmit
	 * @return
	 */
	public ServiceResult taskEvaluation(TaskSubmitVO taskSubmit);
	
	/**
	 * 과제 제출 제출!!(학생용)
	 * @return
	 */
	public ServiceResult taskSubmitSubmit(TaskSubmitVO taskSubmit);
	
	/**
	 * 과제 제출 취소 (학생용)
	 * @param taskCode
	 * @param smemNo
	 * @return
	 */
	public ServiceResult taskSubmitCancle(String taskCode, String smemNo);

}
