package kr.or.ddit.professor.cyber.task.service;

import java.util.List;

import javax.inject.Inject;
import javax.inject.Named;

import org.apache.commons.lang3.exception.UncheckedException;
import org.apache.commons.net.ftp.FTPClient;
import org.apache.commons.pool2.ObjectPool;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import kr.or.ddit.enumpkg.ServiceResult;
import kr.or.ddit.professor.cyber.task.dao.TaskDAO;
import kr.or.ddit.professor.cyber.task.dao.TaskSubmitDAO;
import kr.or.ddit.professor.cyber.task.vo.ProgressStatusVO;
import kr.or.ddit.utils.file.dao.FileDAO;
import kr.or.ddit.utils.file.service.FTPFileService;
import kr.or.ddit.vo.cyber.TaskSubmitVO;
import kr.or.ddit.vo.cyber.TaskVO;
import kr.or.ddit.vo.user.StudentVO;
import lombok.extern.slf4j.Slf4j;

@Slf4j
@Service
public class TaskServiceImpl implements TaskService {
	
	@Inject
	private TaskDAO tDao;
	@Inject
	private TaskSubmitDAO tsDao;
	@Inject
	private FTPFileService fService;
	
	@Override
	public List<TaskVO> retrieveTaskList(String lecCode, String taskStatus) {
		
		List<TaskVO> taskList = tDao.selectTaskList(lecCode, taskStatus);
		
		if(taskList != null) {
			for(TaskVO task : taskList) {
				task.setProgressStatus(progressStatusCalculation(task));
				task.setTaskPeriod(StringToDateFormat(task.getTaskPeriod()));
			}
		}
		
		return taskList;
	}
	
	@Override
	public List<TaskVO> retrieveTaskListS(String lecCode, String taskStatus, String smemNo) {
		
		List<TaskVO> taskList = tDao.selectTaskListS(lecCode, taskStatus, smemNo);
		
		if(taskList != null) {
			for(TaskVO task : taskList) {
				task.setTaskPeriod(StringToDateFormat(task.getTaskPeriod()));
			}
		}
		
		return taskList;
	}

	@Override
	@Transactional
	public ServiceResult modifyTask(TaskVO task) { //수정내용 저장
		
		try {
			task.setTaskPeriod(DataFormatToString(task.getTaskPeriod()));
			if(tDao.updateTask(task) > 0) {
				if (task.getDeleteFiles() != null)
					fService.deleteFiles(task.getDeleteFiles());
				
				if (task.getTaskFiles()[0].getSize() > 0)
					fService.sendFiles(task.getGfNo(), task.getTaskFiles());
				return ServiceResult.OK;
			}else {
				return ServiceResult.FAIL;
			}
		} catch (Exception e) {
			throw new UncheckedException(e);
		}
	}
	
	@Override
	@Transactional
	public ServiceResult createTask(TaskVO task) { // 새로 등록
		try {
			
			//gfNo 폴더 생성 + DB 저장
			String gfNo = fService.selecStringGFNO();
			task.setGfNo(gfNo);
			fService.makeGFNOFolder(gfNo);
			
			task.setTaskPeriod(DataFormatToString(task.getTaskPeriod()));
			if(tDao.insertTask(task) > 0) {
				if (task.getTaskFiles().length > 0 && task.getTaskFiles()[0].getSize() > 0)
					fService.sendFiles(task.getGfNo(), task.getTaskFiles());
				return ServiceResult.OK;
			}else {
				return ServiceResult.FAIL;
			}
		}catch (Exception e) {
			throw new UncheckedException(e);
		}
	}

	@Inject
	private FileDAO dao;
	
	@Inject
	@Named("ftpClientPool")
	private ObjectPool<FTPClient> ftpClientPool;
	
	@Override
	@Transactional
	public ServiceResult uploadTask(String taskCode, String taskStatus) {
		
		try {
			if(taskStatus.equals("ST02")) {
				ServiceResult result = tDao.uploadTask(taskCode, taskStatus) > 0 ? ServiceResult.OK:ServiceResult.FAIL;
				if(result == ServiceResult.OK) {
					
					List<StudentVO> allStudent = tDao.selectAllStudent(taskCode);
					
					for(StudentVO stu :allStudent) {
						TaskSubmitVO taskSubmit = new TaskSubmitVO();
						taskSubmit.setSmemNo(stu.getSmemNo());
						taskSubmit.setTaskCode(taskCode);
						
						String gfNo = dao.selectGFNO();
						taskSubmit.setGfNo(gfNo);
						if(dao.insertGroupFile(gfNo) > 0) {
							FTPClient ftpClient = ftpClientPool.borrowObject();
							try {
	                            ftpClient.makeDirectory(gfNo);
	                        } finally {
	                            ftpClientPool.returnObject(ftpClient);
	                        }
						}
						result = tsDao.insertTaskSubmit(taskSubmit) > 0 ? ServiceResult.OK:ServiceResult.FAIL;
					}
				}
				return result;
			}
		}catch (Exception e) {
			throw new UncheckedException(e);
		}
		
		return tDao.uploadTask(taskCode, taskStatus) > 0 ? ServiceResult.OK:ServiceResult.FAIL;
	}

	@Override
	@Transactional
	public ServiceResult removeTask(String taskCode) {
		try {
			TaskVO task = tDao.selectTask(taskCode);
			String gfNo = task.getGfNo();
			
			if(tDao.deleteTask(taskCode) > 0) {
				if(fService.deleteGoupFile(gfNo) == ServiceResult.OK) {
					if(fService.deleteFolder(gfNo)) {
						return ServiceResult.OK;
					}
				}
				return ServiceResult.FAIL;
			}
		}catch (Exception e) {
			throw new UncheckedException(e);
		}
		return ServiceResult.FAIL;
	}

	@Override
	public ServiceResult taskEvaluation(TaskSubmitVO taskSubmit) {
		return tsDao.taskEvaluation(taskSubmit) > 0 ? ServiceResult.OK:ServiceResult.FAIL;
	}

	@Override
	public TaskVO retrieveTask(String taskCode) {
		TaskVO task = tDao.selectTask(taskCode);
		task.setFileList(fService.selectFileList(task.getGfNo()));
		task.setTaskPeriod(StringToDateFormat(task.getTaskPeriod()));
		return task;
	}

	@Override
	public List<TaskSubmitVO> retrieveTaskSubmitList(String taskCode) {
		return tsDao.selectTaskSubmitList(taskCode);
	}

	@Override
	public TaskSubmitVO retrieveTaskSubmit(String taskCode, String smemNo) {
		TaskSubmitVO taskSubmit = tsDao.selectTaskSubmit(taskCode, smemNo);
		taskSubmit.setFileList(fService.selectFileList(taskSubmit.getGfNo()));
		return taskSubmit;
	}
	
	@Override
	public ServiceResult taskSubmitSubmit(TaskSubmitVO taskSubmit) {
		
		try {
			if(tsDao.taskSubmit(taskSubmit.getTaskCode(), taskSubmit.getSmemNo(), "제출") > 0) {
				if (taskSubmit.getDeleteFiles() != null && taskSubmit.getDeleteFiles()[0].length() > 0)
					fService.deleteFiles(taskSubmit.getDeleteFiles());
				
				if (taskSubmit.getTaskSubmitFiles() != null && taskSubmit.getTaskSubmitFiles()[0].getSize() > 0)
					fService.sendFiles(taskSubmit.getGfNo(), taskSubmit.getTaskSubmitFiles());
				return ServiceResult.OK;
			}else {
				return ServiceResult.FAIL;
			}
		} catch (Exception e) {
			throw new UncheckedException(e);
		}
		
	}
	
	@Override
	public ServiceResult taskSubmitCancle(String taskCode, String smemNo) {
		return tsDao.taskSubmit(taskCode, smemNo, "미제출") > 0 ? ServiceResult.OK:ServiceResult.FAIL;
	}
	
	/**
	 * 완료률 구해주는 메서드
	 * @param task
	 * @return
	 */
	public ProgressStatusVO progressStatusCalculation (TaskVO task) {
		int allCount = tDao.selectAllCount(task.getTaskCode());
		int completion = tDao.selectCompletion(task.getTaskCode());
		
		ProgressStatusVO proVo = new ProgressStatusVO(completion, allCount);
		
		return proVo;
	}
	
	/**
	 * 240530 > 24/05/30 
	 * @param stringDate
	 * @return
	 */
	public String StringToDateFormat (String stringDate) {
		
		String yy = stringDate.substring(0,2);
		String mm = stringDate.substring(2,4);
		String dd = stringDate.substring(4,6);
		
		String ymd = yy + "/" + mm + "/" + dd;
		return ymd;
	}
	
	/**
	 * 2024-05-30 > 240530
	 * @param DataFormat
	 * @return
	 */
	public String DataFormatToString (String DataFormat) {
		String one = DataFormat.replace("-", "");
		String two = one.substring(2);
		return two;
	}


}
