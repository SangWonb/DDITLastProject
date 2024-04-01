package kr.or.ddit.professor.cyber.task.controller;

import java.util.List;
import java.util.Map;

import javax.inject.Inject;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import kr.or.ddit.enumpkg.ServiceResult;
import kr.or.ddit.professor.cyber.task.dao.TaskDAO;
import kr.or.ddit.professor.cyber.task.dao.TaskSubmitDAO;
import kr.or.ddit.professor.cyber.task.service.TaskService;
import kr.or.ddit.vo.cyber.TaskSubmitVO;
import kr.or.ddit.vo.cyber.TaskVO;
import lombok.extern.slf4j.Slf4j;

@Slf4j
@Controller
@RequestMapping("professor/cyber/{lecCode}/task")
public class TaskControllerP {
	
	//http://localhost/lcms/professor/cyber/LEC004/task
	
	@Inject
	TaskService service;
	
	@Inject
	TaskSubmitDAO tsDao;
	
	@Inject
	TaskDAO tDao;
	
	@GetMapping
	public String taskList(@PathVariable String lecCode) {
		return "tiles:professor/cyber/task/taskListP";
	}
	
	//과제목록 조회
	@GetMapping("taskListData")
	public String taskListData(@PathVariable String lecCode, @RequestParam String taskStatus, Model model) {
		
		List<TaskVO> taskList = service.retrieveTaskList(lecCode, taskStatus);
		model.addAttribute("taskList", taskList);
		
		return "jsonView";
	}
	
	@GetMapping("taskData")
	public String taskData(@PathVariable String lecCode, @RequestParam String taskCode, Model model) {
		
		TaskVO task = service.retrieveTask(taskCode);
		List<TaskSubmitVO> taskSubmitList = service.retrieveTaskSubmitList(taskCode);
		
		model.addAttribute("task", task);
		model.addAttribute("taskSubmitList", taskSubmitList);
		
		return "jsonView";
	}
	
	@GetMapping("taskSubmitData")
	public String taskSubmitData(@RequestParam String taskCode, @RequestParam String smemNo, Model model) {
		
		TaskSubmitVO taskSubmit = service.retrieveTaskSubmit(taskCode, smemNo);
		model.addAttribute("taskSubmit", taskSubmit);
		
		return "jsonView";
	}
	
	
	@PostMapping("taskEvaluation")
	public String taskEvaluation(@RequestBody TaskSubmitVO taskSubmit, Model model) {
		
		ServiceResult result = service.taskEvaluation(taskSubmit);
		switch (result) {
		case OK:
			model.addAttribute("success", true);
			break;

		default:
			model.addAttribute("success", false);
			model.addAttribute("message", "서버오류");
			break;
		}
		return "jsonView";
	}
	
	@GetMapping("taskNotEvaluationCount")
	public String taskNotEvaluationCountData (@RequestParam String taskCode, Model model) {
		int notEvaluationCount = tsDao.taskNotEvaluationCount(taskCode);
		
		String count = String.valueOf(notEvaluationCount);
		
		model.addAttribute("count", count);
		return "jsonView";
	}
	
	@GetMapping("taskStatusChange")
	public String taskStatusChange (@RequestParam String taskCode,@RequestParam String taskStatus, Model model) {
		ServiceResult result = service.uploadTask(taskCode, taskStatus);
		switch (result) {
		case OK:
			model.addAttribute("success", true);
			break;

		default:
			model.addAttribute("success", false);
			model.addAttribute("message", "서버오류");
			break;
		}
		return "jsonView";
	}
	
	@PostMapping("taskSaveUpload")
	public String taskSaveUpload (@ModelAttribute TaskVO task, @RequestParam Map<String,Object> allInfo, Model model) {
		
		boolean success = true;
		
		boolean isnew = Boolean.parseBoolean((String) allInfo.get("isnew"));
		String wantAction = (String) allInfo.get("wantAction");
		
		if(isnew) {
			//insert 부터 해야함.
			if (service.createTask(task) == ServiceResult.FAIL) {success = false;}
		}else {
			if (service.modifyTask(task) == ServiceResult.FAIL) {success = false;}
		}
		
		if(wantAction.equals("upload")) {
			if (service.uploadTask(task.getTaskCode(), "ST02") == ServiceResult.FAIL) {success = false;}
		}
		
		model.addAttribute("success", success);
		
		return "jsonView";
	}
	
	@GetMapping("taskDelete")
	public String taskDelete (@RequestParam String taskCode, Model model) {
		
		ServiceResult result = service.removeTask(taskCode);
		
		if(result == ServiceResult.OK) {
			model.addAttribute("success", true);
		}else {
			model.addAttribute("success", false);
		}
		
		return "jsonView";
	}
	
	
	@GetMapping("{taskCode}")
	public String taskView(@PathVariable String taskCode) {
		return "professor/cyber/task/taskViewP";
	}
	
	//과제목록 조회
	@GetMapping("taskEval")
	public String taskEval(@PathVariable String lecCode, Model model) {
		tDao.taskEval(lecCode);
		return "jsonView";
	}

}
