package kr.or.ddit.student.cyber.task.controller;

import java.util.List;
import java.util.Map;

import javax.inject.Inject;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import kr.or.ddit.enumpkg.ServiceResult;
import kr.or.ddit.professor.cyber.task.dao.TaskDAO;
import kr.or.ddit.professor.cyber.task.dao.TaskSubmitDAO;
import kr.or.ddit.professor.cyber.task.service.TaskService;
import kr.or.ddit.utils.annotation.RealUser;
import kr.or.ddit.vo.cyber.TaskSubmitVO;
import kr.or.ddit.vo.cyber.TaskVO;
import kr.or.ddit.vo.user.StudentVO;
import lombok.extern.slf4j.Slf4j;

@Slf4j
@Controller
@RequestMapping("/student/cyber/{lecCode}/task")
public class TaskControllerS {
	
	@Inject
	TaskService service;
	
	@Inject
	TaskSubmitDAO tsDao;
	
	@Inject
	TaskDAO tDao;
	
	@GetMapping
	public String TaskList(@PathVariable String lecCode) {
		return "tiles:student/cyber/task/taskListS";
	}
	
	//과제목록 조회
	@GetMapping("taskListData")
	public String taskListData(@PathVariable String lecCode, @RequestParam String taskStatus, Model model, @RealUser StudentVO student) {
		
		List<TaskVO> taskList = service.retrieveTaskListS(lecCode, taskStatus, student.getSmemNo());
		model.addAttribute("taskList", taskList);
		
		return "jsonView";
	}
		
	@GetMapping("taskData")
	public String taskData(@PathVariable String lecCode, @RequestParam String taskCode, Model model, @RealUser StudentVO student) {
		
		TaskVO task = service.retrieveTask(taskCode);
		TaskSubmitVO taskSubmit = service.retrieveTaskSubmit(taskCode,student.getSmemNo());
		
		model.addAttribute("task", task);
		model.addAttribute("taskSubmit", taskSubmit);
		
		return "jsonView";
	}
	
	@PostMapping("taskSubmit")
	public String taskSubmit (@ModelAttribute TaskSubmitVO taskSubmit, @RealUser StudentVO student, Model model) {
		
		taskSubmit.setSmemNo(student.getSmemNo());
		ServiceResult result = service.taskSubmitSubmit(taskSubmit);
		switch (result) {
		case OK:
			model.addAttribute("success", true);
			break;
		default:
			model.addAttribute("success", false);
			break;
		}
		
		return "jsonView";
	}
	
	@GetMapping("taskSubmitCancle")
	public String taskSubmitCancle (@RequestParam String taskCode, @RealUser StudentVO student, Model model) {
		
		ServiceResult result = service.taskSubmitCancle(taskCode, student.getSmemNo());
		switch (result) {
		case OK:
			model.addAttribute("success", true);
			break;
		default:
			model.addAttribute("success", false);
			break;
		}
		
		return "jsonView";
	}
	
	//과제목록 조회
	@GetMapping("taskEval")
	public String taskEval(@PathVariable String lecCode, Model model) {
		tDao.taskEval(lecCode);
		return "jsonView";
	}
	

}
