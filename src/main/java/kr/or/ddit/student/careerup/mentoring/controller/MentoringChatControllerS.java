package kr.or.ddit.student.careerup.mentoring.controller;

import java.util.List;
import java.util.Map;

import javax.inject.Inject;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import kr.or.ddit.student.careerup.mentoring.service.MentoringChatServiceS;
import kr.or.ddit.utils.annotation.RealUser;
import kr.or.ddit.utils.paging.BootstrapFormBasePaginationRenderer;
import kr.or.ddit.utils.paging.PaginationInfo;
import kr.or.ddit.utils.paging.PaginationRenderer;
import kr.or.ddit.vo.careerup.MentoringProgramVO;
import kr.or.ddit.vo.user.MemberVO;

@Controller
@RequestMapping("/student/careerup/mentoring")
public class MentoringChatControllerS {
	
	@Inject
	MentoringChatServiceS service;
	
	@GetMapping("menteeMentoring")
	public String menteeMentoring(			
			@RequestParam Map<String, Object> detailCondition
			, @RequestParam(name="page", required = false, defaultValue = "1") int currentPage
			, @RealUser MemberVO mem
			, Model model	
		){
			PaginationInfo paging = new PaginationInfo(1,3);
			
			paging.setCurrentPage(currentPage);
			paging.setDetailCondition(detailCondition);
			
			List<MentoringProgramVO> mentoringList = service.retrieveMenteeMentoringList(mem.getMemNo());
			
			PaginationRenderer renderer = new BootstrapFormBasePaginationRenderer("#submitForm");

			String pagingHTML = renderer.renderPagination(paging);
			
			model.addAttribute("mentoringList", mentoringList);
			model.addAttribute("pagingHTML", pagingHTML);
			model.addAttribute("condition", detailCondition);
			model.addAttribute("contentTitle", "멘토링 진행 / 신청");
		
		return "tiles:student/careerup/mentoring/menteeMentoring";
	}
	
	@GetMapping("mentorMentoring")
	public String mentorMentoring(			
			@RequestParam Map<String, Object> detailCondition
			, @RequestParam(name="page", required = false, defaultValue = "1") int currentPage
			, @RealUser MemberVO mem
			, Model model	
			){
		PaginationInfo paging = new PaginationInfo(1,3);
		
		paging.setCurrentPage(currentPage);
		paging.setDetailCondition(detailCondition);
		
		List<MentoringProgramVO> mentoringList = service.retrieveMentorMentoringList(mem.getMemNo());
		
		PaginationRenderer renderer = new BootstrapFormBasePaginationRenderer("#submitForm");
		
		String pagingHTML = renderer.renderPagination(paging);
		
		model.addAttribute("mentoringList", mentoringList);
		model.addAttribute("pagingHTML", pagingHTML);
		model.addAttribute("condition", detailCondition);
		model.addAttribute("contentTitle", "멘토링 진행 / 신청");
		
		return "tiles:student/careerup/mentoring/mentorMentoring";
	}
}
