package kr.or.ddit.student.cyber.teamproject.controller;

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

import kr.or.ddit.enumpkg.ServiceResult;
import kr.or.ddit.professor.cyber.teamproject.dao.TeamDAO;
import kr.or.ddit.professor.cyber.teamproject.dao.TeamProjectDAO;
import kr.or.ddit.professor.cyber.teamproject.service.TeamProjectService;
import kr.or.ddit.utils.annotation.RealUser;
import kr.or.ddit.vo.cyber.TeamProjectVO;
import kr.or.ddit.vo.cyber.TeamVO;
import kr.or.ddit.vo.user.StudentVO;
import lombok.extern.slf4j.Slf4j;
@Slf4j
@Controller
@RequestMapping("/student/cyber/{lecCode}/teamProject")
public class TeamprojectRetrieveControllerS {
	
	@Inject
	TeamProjectService service;
	@Inject
	TeamDAO dao;
	@Inject
	TeamProjectDAO tpDao;
	
	@GetMapping
	public String teamprojectList(@PathVariable String lecCode) {
		return "tiles:student/cyber/teamproject/teamProjectListS";
	}
	
	//팀플 목록
	@GetMapping("tpListData")
	public String tpListData(@PathVariable String lecCode, @RequestParam String tpStatus, Model model, @RealUser StudentVO student) {
		
		List<TeamProjectVO> tpList = service.retrieveTeamProjectListS(lecCode, tpStatus, student.getSmemNo());
		model.addAttribute("tpList", tpList);
		
		return "jsonView";
	}
	
	@GetMapping("tpData")
	public String tpData(@PathVariable String lecCode, @RequestParam String tpNo, Model model, @RealUser StudentVO student) {
		
		TeamProjectVO tp = service.retrieveTeamProject(tpNo);
		String teamNo = dao.findTeam(tpNo, student.getSmemNo());
		TeamVO team = service.retrieveTeam(teamNo);
		
		model.addAttribute("tp", tp);
		model.addAttribute("team", team);
		
		return "jsonView";
	}
	
	@PostMapping("tpSubmit")
	public String tpSubmit(@ModelAttribute TeamVO team, @RealUser StudentVO student, Model model) {
		
		log.info("\n\n\n\n\n\n\n===== team ====\n{}\n\n\n\n\n\n\n", team);
		team.setSubmitStatus("제출");
		ServiceResult result = service.teamProjectSubmit(team);
		
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
	
	@GetMapping("tpSubmitCancle")
	public String tpSubmitCancle (@RequestParam String teamNo, @RealUser StudentVO student, Model model) {
		
		TeamVO team = new TeamVO();
		team.setSubmitStatus("미제출");
		team.setTeamNo(teamNo);
		ServiceResult result = service.teamProjectSubmit(team);
		
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
	@GetMapping("tpEval")
	public String taskEval(@PathVariable String lecCode, Model model) {
		tpDao.tpEval(lecCode);
		return "jsonView";
	}
	
}
