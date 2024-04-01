package kr.or.ddit.professor.cyber.teamproject.controller;

import java.io.IOException;
import java.util.ArrayList;
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
import com.fasterxml.jackson.core.type.TypeReference;
import com.fasterxml.jackson.databind.ObjectMapper;

import com.fasterxml.jackson.databind.ObjectMapper;

import kr.or.ddit.enumpkg.ServiceResult;
import kr.or.ddit.professor.cyber.teamproject.dao.TeamDAO;
import kr.or.ddit.professor.cyber.teamproject.dao.TeamProjectDAO;
import kr.or.ddit.professor.cyber.teamproject.service.TeamProjectService;
import kr.or.ddit.vo.cyber.TeamMemberVO;
import kr.or.ddit.vo.cyber.TeamProjectVO;
import kr.or.ddit.vo.cyber.TeamVO;
import kr.or.ddit.vo.user.StudentVO;
import lombok.extern.slf4j.Slf4j;

@Slf4j
@Controller
@RequestMapping("professor/cyber/{lecCode}/teamProject")
public class TeamProjectRetrieveControllerP {
	
	@Inject
	TeamProjectService service;
	
	@Inject
	TeamDAO dao;
	
	@Inject
	TeamProjectDAO tpDao;
	
	@GetMapping
	public String teamProjectList(@PathVariable String lecCode) {
		return "tiles:professor/cyber/teamproject/teamProjectListP";
	}
	
	//팀플 목록 조회
	@GetMapping("tpListData")
	public String tpListData(@PathVariable String lecCode, @RequestParam String tpStatus, Model model) {
		
		List<TeamProjectVO> tpList = service.retrieveTeamProjectList(lecCode, tpStatus);
		model.addAttribute("tpList", tpList);
		
		return "jsonView";
	}
	
	@GetMapping("tpData")
	public String tpData(@PathVariable String lecCode, @RequestParam String tpNo, Model model) {
		
		TeamProjectVO tp = service.retrieveTeamProject(tpNo);
		List<TeamVO> teamList = service.retrieveTeamList(tpNo);
		
		model.addAttribute("tp", tp);
		model.addAttribute("teamList", teamList);
		
		return "jsonView";
	}
	
	@GetMapping("teamData")
	public String teamData(@PathVariable String lecCode, @RequestParam String teamNo, Model model) {
		
		TeamVO team = service.retrieveTeam(teamNo);
		model.addAttribute("team", team);
		
		return "jsonView";
	}
	
	@GetMapping("allStudentData")
	public String allStudentData(@PathVariable String lecCode, Model model) {
		
		List<StudentVO> allStudent = service.retrieveAllStudent(lecCode);
		model.addAttribute("allStudent", allStudent);
		
		return "jsonView";
	}
	
	@PostMapping("teamEvaluation")
	public String teamEvaluation(@RequestBody TeamVO team, Model model) {
		
		
		log.info("\n\n\n\n\n\n\n\n\n\n==== team =====\n{}\n\n\n\n\n\n\n\n\n\n\n",team);
		
		ServiceResult result = service.teamEvaluation(team);
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
	
	@GetMapping("tpNotEvaluationCount")
	public String tpNotEvaluationCount (@RequestParam String tpNo, Model model) {
		
		int notEvaluationCount = dao.teamProjectNotEvaluationCount(tpNo);
		String count = String.valueOf(notEvaluationCount);
		model.addAttribute("count", count);
		
		return "jsonView";
	}
	
	@GetMapping("tpStatusChange")
	public String tpStatusChange(@RequestParam String tpNo,@RequestParam String tpStatus, Model model) {
		ServiceResult result = service.changeTPStatus(tpNo, tpStatus);
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
	
	@PostMapping("tpSaveUpload")
	public String tpSaveUpload(@ModelAttribute TeamProjectVO teamProject, @RequestParam Map<String, Object> allInfo,@RequestParam("listTeamvo") String listTeamvo, Model model) {
		
		boolean success = true;
		
		boolean isnew = Boolean.parseBoolean((String) allInfo.get("isnew"));
		String wantAction = (String) allInfo.get("wantAction");
		
		 ObjectMapper objectMapper = new ObjectMapper();
		 List<Map<String, Object>> listTeamData = null;
	    try {
	        listTeamData = objectMapper.readValue(listTeamvo, new TypeReference<List<Map<String, Object>>>() {});
	        log.info("\n\n\n\n\n\n\n\n\n\n==== listTeamData =====\n{}\n\n\n\n\n\n\n\n\n\n\n",listTeamData);
	        // 이후 requestData를 사용하여 필요한 로직을 처리합니다.
	    } catch (IOException e) {
	        e.printStackTrace();
	    }
	    
	    List<TeamVO> teamList = new ArrayList<TeamVO>();
	    
	    for(Map<String, Object> td :listTeamData) {
	    	TeamVO team = new TeamVO();
	    	String teamName = (String) td.get("teamName");
	    	String teamNo = (String) td.get("teamNo");
	    	team.setTeamName(teamName);
	    	team.setTeamNo(teamNo);
	    	List<Object> smemNos = (List<Object>) td.get("smemNos");
	    	List<TeamMemberVO> tmList = new ArrayList<TeamMemberVO>();
	    	for(Object smemNo : smemNos) {
	    		TeamMemberVO teamMember = new TeamMemberVO();
	    		teamMember.setSmemNo(String.valueOf(smemNo));
	    		tmList.add(teamMember);
	    	}
	    	team.setTeamMemberList(tmList);
	    	
	    	teamList.add(team);
	    }
	    
	    teamProject.setTeamList(teamList);
	    
	    if(isnew) {
			//insert 부터 해야함.
			if (service.createTeamProject(teamProject) == ServiceResult.FAIL) {success = false;}
			log.info("\n\n\n\n====== success1 ======\n{}\n\n\n\n",success);
		}else {
			if (service.modifyTeamProject(teamProject) == ServiceResult.FAIL) {success = false;}
			log.info("\n\n\n\n====== success2 ======\n{}\n\n\n\n",success);
		}
		
		if(wantAction.equals("upload")) {
			if (service.changeTPStatus(teamProject.getTpNo(), "ST02") == ServiceResult.FAIL) {success = false;}
			log.info("\n\n\n\n====== success3 ======\n{}\n\n\n\n",success);
		}
		
		model.addAttribute("success", success);
		
		return "jsonView";
	}
	
	@GetMapping("tpDelete")
	public String tpDelete (@RequestParam String tpNo, Model model) {
		ServiceResult result = service.removeTeamProject(tpNo);
		if(result == ServiceResult.OK) {
			model.addAttribute("success", true);
		}else {
			model.addAttribute("success", false);
		}
		return "jsonView";
	}
	
	@GetMapping("{tpNo}")
	public String teamProjectView(@PathVariable String tpNo) {
		return "professor/cyber/teamproject/teamProjectView";
	}
	
	//과제목록 조회
	@GetMapping("tpEval")
	public String taskEval(@PathVariable String lecCode, Model model) {
		tpDao.tpEval(lecCode);
		return "jsonView";
	}
		

}
