package kr.or.ddit.professor.info.subject.subjectappl.controller;

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
import kr.or.ddit.professor.info.subject.subjectappl.service.SubjectApplServiceP;
import kr.or.ddit.student.careerup.licenserecom.dao.DeptAndSeniorDAO;
import kr.or.ddit.utils.annotation.RealUser;
import kr.or.ddit.validate.InsertGroup;
import kr.or.ddit.validate.UpdateGroup;
import kr.or.ddit.vo.cyber.SubjectVO;
import kr.or.ddit.vo.user.MemberVO;

@Controller
@RequestMapping("/professor/info/subject/subjectappl")
public class SubjectApplControllerP {
	
	@Inject
	SubjectApplServiceP service;
	
	@Inject
	DeptAndSeniorDAO dao;

	@GetMapping("subjectApplList")
	public String applList(@RequestParam Map<String, Object> detailCondition, Model model,
			@RealUser MemberVO mem
	){
			String memNo = mem.getMemNo();
			List<SubjectVO> subjectApplList = service.retrieveSubjectApplList(memNo);
			
			model.addAttribute("subjectApplList", subjectApplList);
			model.addAttribute("memNo", memNo);
			model.addAttribute("condition", detailCondition);
			model.addAttribute("contentTitle", "교과목 개설 신청");
		return "tiles:professor/info/subject/subjectappl/subjectApplList";
	}
	
	@GetMapping("subjectApplDetail/{subAppno}")
	public String applView(@PathVariable String subAppno, Model model) {
		SubjectVO subject = service.retrieveSubjectAppl(subAppno);
		model.addAttribute("subject", subject);
		return "professor/info/subject/subjectappl/subjectApplDetail";
	}
	
	@GetMapping("subjectApplInsertForm")
	public String applInsertForm(Model model, @RealUser MemberVO mem) {
		String memNo = mem.getMemNo();
		String memName = mem.getMemName();
		List<Map<String, Object>> deptList = dao.selectDeptList();
		model.addAttribute("deptList", deptList);
		model.addAttribute("memNo", memNo);
		model.addAttribute("memName", memName);
		return "professor/info/subject/subjectappl/subjectApplInsertForm";
	}
	
	@PostMapping("subjectApplInsertForm")
	public String applInsertProcess(
			@Validated({ InsertGroup.class, Default.class })
			@ModelAttribute("subjectVO") SubjectVO subjectVO,
			Errors errors, RedirectAttributes redirectAttributes, @RealUser MemberVO mem, Model model) {
		
		String logicalViewName = null;
		if (!errors.hasErrors()) {
			ServiceResult result = service.subjectApplInserst(subjectVO);
			String message = null;
			switch (result) {
			case OK:
				logicalViewName = "redirect:/professor/info/subject/subjectappl/subjectApplList";
				break;
			default:
				logicalViewName = "professor/info/subject/subjectappl/subjectApplInsertForm";
				message = "잘못된 정보 포함";
				break;
			}
			model.addAttribute("message", message);

		} else {
			logicalViewName = "professor/info/subject/subjectappl/subjectApplInsertForm";
		}
		return logicalViewName;
	}
	
	@GetMapping("subjectApplEditForm/{subAppno}")
	public String applEditForm(@PathVariable String subAppno, Model model) {
		SubjectVO subject = service.retrieveSubjectAppl(subAppno);
		List<Map<String, Object>> deptList = dao.selectDeptList();
		model.addAttribute("deptList", deptList);
		model.addAttribute("subject", subject);
		return "professor/info/subject/subjectappl/subjectApplEditForm";
	}
	
	@PostMapping("subjectApplEditForm")
	public String applEditProcess(
			@Validated({ UpdateGroup.class, Default.class })
			 @ModelAttribute("subjectVO") SubjectVO subjectVO,
			Errors errors, RedirectAttributes redirectAttributes, Model model) {
		
		String logicalViewName = null;
		if (!errors.hasErrors()) {
			ServiceResult result = service.modifySubjectAppl(subjectVO);
			String message = null;
			switch (result) {
			case OK:
				logicalViewName = "redirect:/professor/info/subject/subjectappl/subjectApplList";
				break;
			default:
				logicalViewName = "professor/info/subject/subjectappl/subjectApplEditForm";
				message = "잘못된 정보 포함";
				break;
			}
			model.addAttribute("message", message);

		} else {
			logicalViewName = "professor/info/subject/subjectappl/subjectApplEditForm";
		}
		return logicalViewName;
	}
	
	@PostMapping("del")
	public String deleteProcess(@RequestParam String subAppno, Model model, RedirectAttributes redirectAttributes) {
		service.removeSubjectAppl(subAppno);
		return "redirect:/professor/info/subject/subjectappl/subjectApplList";
	}
}