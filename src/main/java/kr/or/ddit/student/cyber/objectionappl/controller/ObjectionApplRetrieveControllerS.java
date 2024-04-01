package kr.or.ddit.student.cyber.objectionappl.controller;

import java.util.List;

import javax.inject.Inject;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import kr.or.ddit.enumpkg.ServiceResult;
import kr.or.ddit.professor.cyber.attendance.dao.AttendDAO;
import kr.or.ddit.professor.cyber.attendance.service.AttendService;
import kr.or.ddit.professor.cyber.grade.service.GradeService;
import kr.or.ddit.professor.cyber.objectionappl.service.ObjectApplService;
import kr.or.ddit.professor.cyber.task.dao.TaskSubmitDAO;
import kr.or.ddit.professor.cyber.task.service.TaskService;
import kr.or.ddit.professor.cyber.teamproject.dao.TeamDAO;
import kr.or.ddit.professor.cyber.teamproject.service.TeamProjectService;
import kr.or.ddit.utils.annotation.RealUser;
import kr.or.ddit.vo.cyber.AttendVO;
import kr.or.ddit.vo.cyber.ComplaintVO;
import kr.or.ddit.vo.cyber.TaskSubmitVO;
import kr.or.ddit.vo.cyber.TaskVO;
import kr.or.ddit.vo.cyber.TeamProjectVO;
import kr.or.ddit.vo.cyber.TeamVO;
import kr.or.ddit.vo.user.StudentVO;
import lombok.extern.slf4j.Slf4j;

@Slf4j
@Controller
@RequestMapping("/student/cyber/{lecCode}/objectionAppl")
public class ObjectionApplRetrieveControllerS {
	
	@Inject
	AttendService aService;
	@Inject
	AttendDAO aDao;
	@Inject
	TaskService tskService;
	@Inject
	TaskSubmitDAO tsDao;
	@Inject
	TeamProjectService tpService;
	@Inject
	TeamDAO tDao;
	@Inject
	ObjectApplService oService;
	@Inject
	GradeService gService;
	
	@GetMapping
	public String objectApplList(@PathVariable String lecCode, Model model, RedirectAttributes redirect) {
		
		if(!oService.objectApplSeason()) {
			redirect.addFlashAttribute("message", "이의신청기간이 아닙니다.");
			return "redirect:/student/cyber/syllabus/syllabusDetail/"+lecCode;	
		}
		
		model.addAttribute("contentTitle", "이의신청");
		return "tiles:student/cyber/objectionappl/objectionApplListS";
	}
	
	@PostMapping("complaintAdd")
	public String complaintAdd(
		@PathVariable String lecCode, RedirectAttributes redirect, @RealUser StudentVO student,
		@ModelAttribute ComplaintVO com
		) {
		boolean success = true;
		com.setSmemNo(student.getSmemNo());
		ServiceResult result = oService.createCom(com);
		if(result == ServiceResult.FAIL) success = false;
		
		redirect.addFlashAttribute("success", success);
		
		return "redirect:/student/cyber/"+ lecCode +"/grade";
	}
	
	@GetMapping("comListData")
	public String comListData(@PathVariable String lecCode, Model model, @RealUser StudentVO student) {
		List<ComplaintVO> comList = oService.retrieveComListS(lecCode, student.getSmemNo());
		model.addAttribute("comList", comList);
		return "jsonView";
	}
	
	@GetMapping("comDetailData")
	public String comDetailData(@PathVariable String lecCode, Model model, @RequestParam String cptNo, @RealUser StudentVO student) {
		
		ComplaintVO com = oService.retrieveCom(cptNo);
		switch (com.getCptType()) {
		case "출결":
			AttendVO attendVO = aDao.selectAttendPK(com.getCptCode());
			model.addAttribute("attend", attendVO);
			break;
		case "과제":
			TaskVO task = tskService.retrieveTask(com.getCptCode());
			TaskSubmitVO taskSubmit = tskService.retrieveTaskSubmit(task.getTaskCode(), student.getSmemNo());
			task.setTaskSubmit(taskSubmit);
			model.addAttribute("task", task);			
			break;
		case "팀플":
			TeamProjectVO teamProject = tpService.retrieveTeamProject(com.getCptCode());
			String findTeam = tDao.findTeam(teamProject.getTpNo(), student.getSmemNo());
			TeamVO team = tpService.retrieveTeam(findTeam);
			teamProject.setTeam(team);
			model.addAttribute("tp", teamProject);			
			break;
		}
		model.addAttribute("com", com);
		return "jsonView";
	}
	
	@GetMapping("comDelete")
	public String comDelete(@PathVariable String lecCode, RedirectAttributes redirect, @RequestParam String cptNo) {
		
		boolean success = true;
		ServiceResult result = oService.removeCom(cptNo);
		if(result == ServiceResult.FAIL) success = false;
		
		redirect.addFlashAttribute("success", success);
		
		return "redirect:/student/cyber/"+ lecCode +"/objectionAppl";
	}

}
