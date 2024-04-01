package kr.or.ddit.student.careerup.mentoring.mentoringmentor.controller;

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
import kr.or.ddit.student.careerup.mentoring.mentoringmentor.dao.RejectSelectBox;
import kr.or.ddit.student.careerup.mentoring.mentoringmentor.service.MentorServiceS;
import kr.or.ddit.utils.annotation.RealUser;
import kr.or.ddit.utils.paging.BootstrapFormBasePaginationRenderer;
import kr.or.ddit.utils.paging.PaginationInfo;
import kr.or.ddit.utils.paging.PaginationRenderer;
import kr.or.ddit.validate.UpdateGroup;
import kr.or.ddit.vo.careerup.MenteeVO;
import kr.or.ddit.vo.user.MemberVO;
import lombok.extern.slf4j.Slf4j;

@Slf4j
@Controller
@RequestMapping("/student/careerup/mentoring/mentoringmentor")
public class MentoringMentorDecisionControllerS {
	
	@Inject
	MentorServiceS service;
	
	@Inject
	RejectSelectBox dao;
	
	@GetMapping("mentoringMentorDecision")
	public String decisionList(		
			@RequestParam Map<String, Object> detailCondition
			, @RequestParam(name="page", required = false, defaultValue = "1") int currentPage
			, @RealUser MemberVO mem
			, Model model	
		){
			PaginationInfo paging = new PaginationInfo(10,3);
			
			paging.setCurrentPage(currentPage);
			paging.setDetailCondition(detailCondition);
			
			String memNo = mem.getMemNo();
			List<MenteeVO> mentoringDecisionList = service.retrieveMentorDecisionList(memNo);
			PaginationRenderer renderer = new BootstrapFormBasePaginationRenderer("#submitForm");

			String pagingHTML = renderer.renderPagination(paging);
			
			model.addAttribute("mentoringDecisionList", mentoringDecisionList);
			model.addAttribute("pagingHTML", pagingHTML);
			model.addAttribute("condition", detailCondition);
			model.addAttribute("contentTitle", "멘토링 진행 / 신청");
		return "tiles:student/careerup/mentoring/mentoringmentor/mentoringMentorDecision";
	}
	
	@GetMapping("decisionEditForm/{menteeNo}")
	public String applEditForm(@PathVariable String menteeNo, Model model) {
		MenteeVO mentoring = service.retrieveMentorDecision(menteeNo);
		List<Map<String, Object>> rejectList = dao.selectRejectList();
		model.addAttribute("mentoring", mentoring);
		model.addAttribute("rejectList", rejectList);
		return "student/careerup/mentoring/mentoringmentor/decisionEditForm";
	}

	@PostMapping(value ="decisionEditForm", consumes = MediaType.APPLICATION_JSON_VALUE)
	public String decisionProcess(			
			@Validated({ UpdateGroup.class, Default.class }) @RequestBody MenteeVO menteeVO,
			Errors errors, RedirectAttributes redirectAttributes, Model model) {
		
		String logicalViewName = null;
		if (!errors.hasErrors()) {
			ServiceResult result = service.modifyAppl(menteeVO);
			String message = null;
			switch (result) {
			case OK:
				logicalViewName = "redirect:/student/careerup/mentoring/mentoringmentor/mentoringMentorDecision";
				break;
			default:
				logicalViewName = "redirect:/student/careerup/mentoring/mentoringmentor/decisionEditForm";
				message = "잘못된 정보 포함";
				break;
			}
			model.addAttribute("message", message);

		} else {
			logicalViewName = "redirect:/student/careerup/mentoring/mentoringmentor/decisionEditForm";
		}
		return logicalViewName;
	}
}
