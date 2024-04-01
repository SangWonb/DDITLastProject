package kr.or.ddit.student.careerup.mentoring.mentoringmentee.controller;

import java.util.List;
import java.util.Map;

import javax.inject.Inject;
import javax.validation.groups.Default;

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
import kr.or.ddit.student.careerup.licenserecom.dao.DeptAndSeniorDAO;
import kr.or.ddit.student.careerup.mentoring.mentoringmentee.service.MenteeServiceS;
import kr.or.ddit.utils.annotation.RealUser;
import kr.or.ddit.utils.paging.BootstrapFormBasePaginationRenderer;
import kr.or.ddit.utils.paging.PaginationInfo;
import kr.or.ddit.utils.paging.PaginationRenderer;
import kr.or.ddit.validate.BywGroup;
import kr.or.ddit.validate.UpdateGroup;
import kr.or.ddit.vo.careerup.MenteeVO;
import kr.or.ddit.vo.careerup.SeniorCoworkerVO;
import kr.or.ddit.vo.user.MemberVO;
import kr.or.ddit.vo.user.StudentVO;
import lombok.extern.slf4j.Slf4j;

@Slf4j
@Controller
@RequestMapping("/student/careerup/mentoring/mentoringmentee")
public class MentoringMenteeApplControllerS {
	
	@Inject
	MenteeServiceS service;
	@Inject
	DeptAndSeniorDAO dao;

	@GetMapping("mentoringMenteeAppl")
	public String mentorList(	@RequestParam Map<String, Object> detailCondition
			, @RequestParam(name="page", required = false, defaultValue = "1") int currentPage
			, Model model	
			, @ModelAttribute("paging") PaginationInfo page
		){
		PaginationInfo paging = new PaginationInfo(10,5);

		paging.setCurrentPage(currentPage);
		paging.setDetailCondition(detailCondition);
		paging.setSimpleCondition(page.getSimpleCondition());

		List<SeniorCoworkerVO> mentorList = service.retrieveMentorList(paging);

		PaginationRenderer renderer = new BootstrapFormBasePaginationRenderer("#submitForm");

		String pagingHTML = renderer.renderPagination(paging);

		model.addAttribute("mentorList", mentorList);
		model.addAttribute("pagingHTML", pagingHTML);
		model.addAttribute("paging", paging);
		model.addAttribute("condition", detailCondition);
		model.addAttribute("contentTitle", "멘토 목록");
		return "tiles:student/careerup/mentoring/mentoringmentee/mentoringMenteeAppl";
	}
	
	@GetMapping("applDetail/{menteeNo}")
	public String applView(@PathVariable String menteeNo, Model model) {
		MenteeVO mentoringAppl = service.retrieveMentorAppl(menteeNo);
		model.addAttribute("mentoringAppl", mentoringAppl);
		return "student/careerup/mentoring/mentoringmentee/applDetail";
	}
	
	@GetMapping("applEditForm/{menteeNo}")
	public String applEditForm(@PathVariable String menteeNo, Model model) {
		MenteeVO mentoring = service.retrieveMentorAppl(menteeNo);
		model.addAttribute("mentoring", mentoring);
		return "student/careerup/mentoring/mentoringmentee/applEditForm";
	}
	
	@PostMapping("applEditForm/{menteeNo}")
	public String applEditProcess(
			@Validated({ UpdateGroup.class, Default.class })
			@PathVariable String menteeNo, @ModelAttribute("menteeNo") MenteeVO menteeVO,
			Errors errors, RedirectAttributes redirectAttributes, Model model) {
		
		String logicalViewName = null;
		if (!errors.hasErrors()) {
			ServiceResult result = service.modifyAppl(menteeVO);
			String message = null;
			switch (result) {
			case OK:
				logicalViewName = "redirect:/student/careerup/mentoring/mentoringmentee/mentoringMenteeAppl";
				break;
			default:
				logicalViewName = "student/careerup/mentoring/mentoringmentee/applEditForm";
				message = "잘못된 정보 포함";
				break;
			}
			model.addAttribute("message", message);

		} else {
			logicalViewName = "student/careerup/mentoring/mentoringmentee/applEditForm";
		}
		return logicalViewName;
	}
	
	@PostMapping("/del/{menteeNo}")
	public String deleteProcess(@PathVariable String menteeNo, Model model, RedirectAttributes redirectAttributes) {
		ServiceResult cnt = service.deleteMentoring(menteeNo);
		model.addAttribute("cnt", cnt);
		return "redirect:/student/careerup/mentoring/mentoringmentee/mentoringMenteeAppl";
	}
	
	@GetMapping("forMentor")
	public String forMentor(
			Model model, @RealUser MemberVO mem , @ModelAttribute("student") StudentVO vo
		){
		List<Map<String, Object>> selectDeptList = dao.selectDeptList();
		List<Map<String, Object>> selectSeniorCompanyTypeList = dao.selectSeniorCompanyTypeList();
		
		model.addAttribute("companyTypeList", selectSeniorCompanyTypeList);
		model.addAttribute("deptList", selectDeptList);
		model.addAttribute("memTel", mem.getMemTel());
		model.addAttribute("memNo", mem.getMemNo());
		model.addAttribute("memName", mem.getMemName());
		return "student/careerup/mentoring/mentoringmentee/forMentor";
	}
	
	@PostMapping("forMentor")
	public String forMentorProcess(
			@Validated(BywGroup.class)
			@ModelAttribute("student") StudentVO vo,
			Errors errors, RedirectAttributes redirectAttributes, Model model) {
		
		String logicalViewName = null;
		if (!errors.hasErrors()) {
			ServiceResult result = service.createMentor(vo);
			log.info("\n\n\n\n\n{}\n\n\n\n\n",vo);
			String message = null;
			switch (result) {
			case OK:
				logicalViewName = "redirect:/student/careerup/mentoring/mentoringmentee/mentoringMenteeAppl";
				break;
			default:
				logicalViewName = "student/careerup/mentoring/mentoringmentee/forMentor";
				message = "잘못된 정보 포함";
				break;
			}
			model.addAttribute("message", message);

		} else {
			logicalViewName = "student/careerup/mentoring/mentoringmentee/forMentor";
		}
		return logicalViewName;
	}
}