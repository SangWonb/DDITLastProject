package kr.or.ddit.professor.cyber.objectionappl.controller;

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
import kr.or.ddit.professor.cyber.teamproject.dao.TeamProjectDAO;
import kr.or.ddit.professor.cyber.teamproject.service.TeamProjectService;
import kr.or.ddit.utils.paging.PaginationInfo;
import kr.or.ddit.utils.paging.PaginationRenderer;
import kr.or.ddit.utils.paging.TamplateFormBasePagingationRenderer;
import kr.or.ddit.vo.cyber.AttendVO;
import kr.or.ddit.vo.cyber.ComplaintVO;
import kr.or.ddit.vo.cyber.TaskSubmitVO;
import kr.or.ddit.vo.cyber.TaskVO;
import kr.or.ddit.vo.cyber.TeamProjectVO;
import kr.or.ddit.vo.cyber.TeamVO;
import lombok.extern.slf4j.Slf4j;
import okhttp3.internal.concurrent.Task;

@Slf4j
@Controller
@RequestMapping("professor/cyber/{lecCode}/objectionAppl")
public class ObjectionApplRetrieveControllerP {
	
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
	public String objectionApplList(@PathVariable String lecCode, Model model, RedirectAttributes redirect) {
		
		if(!oService.objectApplSeason()) {
			redirect.addFlashAttribute("message", "이의신청기간이 아닙니다.");
			return "redirect:/professor/cyber/syllabus/syllabusDetail/"+lecCode;	
		}
		
		model.addAttribute("contentTitle", "이의신청");
		return "tiles:professor/cyber/objectionappl/objectionApplListP";
	}
	
	@GetMapping("comListData")
	public String comListData(
		@PathVariable String lecCode, Model model,
		@RequestParam(name="page", required = false, defaultValue = "1") int currentPage) {
		
		PaginationInfo paging = new PaginationInfo(10,3);
		paging.setCurrentPage(currentPage);
		
		List<ComplaintVO> comList = oService.retrieveComListP(lecCode, paging);
		
		PaginationRenderer renderer = new TamplateFormBasePagingationRenderer("#searchForm");
		String pagingHTML = renderer.renderPagination(paging);
		
		model.addAttribute("comList", comList);
		model.addAttribute("pagingHTML", pagingHTML);
		
		return "jsonView";
	}
	
	@GetMapping("comDetailData")
	public String comDetailData(@PathVariable String lecCode, Model model, @RequestParam String cptNo, @RequestParam String smemNo) {
		
		ComplaintVO com = oService.retrieveCom(cptNo);
		switch (com.getCptType()) {
		case "출결":
			AttendVO attendVO = aDao.selectAttendPK(com.getCptCode());
			model.addAttribute("attend", attendVO);
			break;
		case "과제":
			TaskVO task = tskService.retrieveTask(com.getCptCode());
			TaskSubmitVO taskSubmit = tskService.retrieveTaskSubmit(task.getTaskCode(), smemNo);
			task.setTaskSubmit(taskSubmit);
			model.addAttribute("task", task);			
			break;
		case "팀플":
			TeamProjectVO teamProject = tpService.retrieveTeamProject(com.getCptCode());
			String findTeam = tDao.findTeam(teamProject.getTpNo(), smemNo);
			TeamVO team = tpService.retrieveTeam(findTeam);
			teamProject.setTeam(team);
			model.addAttribute("tp", teamProject);			
			break;
		}
		model.addAttribute("com", com);
		return "jsonView";
	}
	
	@PostMapping("comOk")
	public String comOk(
			@PathVariable String lecCode, RedirectAttributes redirect,
			@ModelAttribute ComplaintVO com,
			@ModelAttribute AttendVO attend, @ModelAttribute TaskSubmitVO taskSubmit, @ModelAttribute TeamVO team) {
			
		boolean success = true;
		switch (com.getCptType()) {
		case "출결":
			if(aDao.updateAttendPk(attend) < 1) {
				success = false;
			}
			break;
		case "과제":
			if(tsDao.updateTaskSubmitScore(taskSubmit) < 1) {
				success = false;
			}
			break;
		case "팀플":
			if(tDao.updateTeamSocre(team) < 1) {
				success = false;
			}
			break;
		}
		
		com.setAppStatus("STA06");
		ServiceResult result = oService.modifyCom(com);
		if(result == ServiceResult.FAIL) success = false;
		
		result = gService.modifyGradeList(lecCode);
		if(result == ServiceResult.FAIL) success = false;
		
		redirect.addFlashAttribute("success", success);
		return "redirect:/professor/cyber/"+ lecCode +"/objectionAppl";
	}
	
	@PostMapping("comNo")
	public String comNo(@PathVariable String lecCode, RedirectAttributes redirect, @ModelAttribute ComplaintVO com) {
		
		com.setAppStatus("STA04");
		ServiceResult result = oService.modifyCom(com);
		if(result == ServiceResult.FAIL) {
			redirect.addFlashAttribute("success", false);
		}else {
			redirect.addFlashAttribute("success", true);
		}
		
		result = gService.modifyGradeList(lecCode);
		if(result == ServiceResult.FAIL) {
			redirect.addFlashAttribute("success", false);
		}else {
			redirect.addFlashAttribute("success", true);
		}
		
		return "redirect:/professor/cyber/"+ lecCode +"/objectionAppl";
	}
	
	
}
