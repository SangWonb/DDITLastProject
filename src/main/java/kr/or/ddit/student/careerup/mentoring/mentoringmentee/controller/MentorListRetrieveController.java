package kr.or.ddit.student.careerup.mentoring.mentoringmentee.controller;

import java.util.List;
import java.util.Map;

import javax.inject.Inject;
import javax.validation.groups.Default;

import org.apache.tiles.autotag.core.runtime.annotation.Parameter;
import org.springframework.security.core.Authentication;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.Errors;
import org.springframework.validation.annotation.Validated;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import kr.or.ddit.enumpkg.ServiceResult;
import kr.or.ddit.student.careerup.mentoring.mentoringmentee.service.MenteeServiceS;
import kr.or.ddit.utils.annotation.RealUser;
import kr.or.ddit.utils.paging.BootstrapFormBasePaginationRenderer;
import kr.or.ddit.utils.paging.PaginationInfo;
import kr.or.ddit.utils.paging.PaginationRenderer;
import kr.or.ddit.validate.InsertGroup;
import kr.or.ddit.vo.careerup.MenteeVO;
import kr.or.ddit.vo.careerup.SeniorCoworkerVO;
import kr.or.ddit.vo.user.MemberVO;
import kr.or.ddit.vo.user.MemberVOWrapper;
import lombok.extern.slf4j.Slf4j;

@Slf4j
@Controller
@RequestMapping("/student/careerup/mentoring/mentoringmentee")
public class MentorListRetrieveController {

	@Inject
	MenteeServiceS service;
	
	@GetMapping("mentorList")
	public String mentorList(			
			@RealUser MemberVO mem , Model model){
		List<MenteeVO> mentoringApplList = service.retrieveMenteeApplList(mem.getMemNo());
		model.addAttribute("mentoringApplList", mentoringApplList);
		model.addAttribute("contentTitle", "멘토링 목록");

		return "student/careerup/mentoring/mentoringmentee/mentorList";
	}
	
	@GetMapping("mentorDetail/{srNo}")
	public String mentorOne(@PathVariable String srNo, Model model) {
		SeniorCoworkerVO mentor = service.retrieveMentor(srNo);
		model.addAttribute("mentor", mentor);
		model.addAttribute("contentTitle", "멘토 상세조회");
		return "student/careerup/mentoring/mentoringmentee/mentorDetail";
	}
	
	@GetMapping("mentorApplForm")
	public String insertForm(Model model, @RequestParam String srNo, @RequestParam String memName, @RealUser MemberVO mem) {
		// principal
		String hakbun = mem.getMemNo();
		
		model.addAttribute("hakbun", hakbun);
		model.addAttribute("memName", memName);
		model.addAttribute("srNo", srNo);
		return "student/careerup/mentoring/mentoringmentee/mentorApplForm";
	}
	
	@PostMapping("mentorApplForm/{srNo}")
	public String insert(
		@Validated({ InsertGroup.class, Default.class })
		@PathVariable String srNo, @ModelAttribute("mentee") MenteeVO menteeNo,
		Errors errors, RedirectAttributes redirectAttributes, Model model
	) {
		String logicalViewName = null;
		
		if (!errors.hasErrors()) {
			ServiceResult result = service.applMentoring(menteeNo);
			String message = null;
			switch (result) {
			case OK:
				logicalViewName = "redirect:/student/careerup/mentoring/mentoringmentee/mentoringMenteeAppl";
				break;
			default:
				logicalViewName = "student/careerup/mentoring/mentoringmentee/mentorApplForm";
				message = "잘못된 정보 포함";
				break;
			}
			model.addAttribute("message", message);
		} else {
			logicalViewName = "student/careerup/mentoring/mentoringmentee/mentorApplForm";
		}
		return logicalViewName;
	}
}
