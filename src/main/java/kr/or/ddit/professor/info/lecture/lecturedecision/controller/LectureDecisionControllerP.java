package kr.or.ddit.professor.info.lecture.lecturedecision.controller;

import java.util.List;
import java.util.Map;

import javax.inject.Inject;
import javax.validation.groups.Default;

import org.springframework.http.MediaType;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.Errors;
import org.springframework.validation.annotation.Validated;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import kr.or.ddit.enumpkg.ServiceResult;
import kr.or.ddit.professor.info.lecture.lectureappl.service.LectureOpenServiceP;
import kr.or.ddit.student.careerup.mentoring.mentoringmentor.dao.RejectSelectBox;
import kr.or.ddit.utils.annotation.RealUser;
import kr.or.ddit.validate.UpdateGroup;
import kr.or.ddit.vo.cyber.LecOpenListVO;
import kr.or.ddit.vo.user.MemberVO;

@Controller
@RequestMapping("/professor/info/lecture/lecturedecision")
public class LectureDecisionControllerP {
	
	@Inject
	LectureOpenServiceP service;
	
	@Inject
	RejectSelectBox dao;

	@GetMapping("lectureDecision")
	public String applList(@RequestParam Map<String, Object> detailCondition, Model model,
			@RealUser MemberVO mem
	){
			String memNo = mem.getMemNo();
			String deptCode = mem.getDeptCode();
			List<LecOpenListVO> lectureDecisionList = service.retrieveLectureDecisionList(deptCode);
			model.addAttribute("lectureDecisionList", lectureDecisionList);
			model.addAttribute("memNo", memNo);
			model.addAttribute("condition", detailCondition);
			model.addAttribute("contentTitle", "강의 개설 신청 승인/반려");
		return "tiles:professor/info/lecture/lecturedecision/lectureDecision";
	}
	
	@GetMapping("lectureDecisionEditForm/{lolAppno}")
	public String editView(@PathVariable String lolAppno, Model model) {
		LecOpenListVO lecture = service.retrieveLectureAppl(lolAppno);
		List<Map<String, Object>> rejectList = dao.selectSubbjectRejectList();
		model.addAttribute("rejectList", rejectList);
		model.addAttribute("lecture", lecture);
		return "professor/info/lecture/lecturedecision/lectureDecisionEditForm";
	}
	
	@PostMapping(value="lectureDecisionEditForm", consumes = MediaType.APPLICATION_JSON_VALUE)
	public String editProcess(
			@Validated({ UpdateGroup.class, Default.class }) @RequestBody LecOpenListVO vo,
			Errors errors, RedirectAttributes redirectAttributes, Model model) {
		
		String logicalViewName = null;
		if (!errors.hasErrors()) {
			ServiceResult result = service.modifyLectureDecision(vo);
			String message = null;
			switch (result) {
			case OK:
				logicalViewName = "redirect:/professor/info/lecture/lecturedecision/lectureDecision";
				break;
			default:
				logicalViewName = "professor/info/lecture/lecturedecision/lectureDecisionEditForm";
				message = "잘못된 정보 포함";
				break;
			}
			model.addAttribute("message", message);

		} else {
			logicalViewName = "professor/info/lecture/lecturedecision/lectureDecisionEditForm";
		}
		return logicalViewName;
	}
}
