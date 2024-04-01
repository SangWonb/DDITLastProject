package kr.or.ddit.professor.info.lecture.lectureappl.controller;

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
import kr.or.ddit.professor.info.lecture.lectureappl.dao.SubjectListDAOP;
import kr.or.ddit.professor.info.lecture.lectureappl.service.LectureOpenServiceP;
import kr.or.ddit.utils.annotation.RealUser;
import kr.or.ddit.validate.InsertGroup;
import kr.or.ddit.validate.UpdateGroup;
import kr.or.ddit.vo.cyber.LecOpenListVO;
import kr.or.ddit.vo.user.MemberVO;
import lombok.extern.slf4j.Slf4j;

@Slf4j
@Controller
@RequestMapping("/professor/info/lecture/lectureappl")
public class LectureApplControllerP {
	@Inject
	LectureOpenServiceP service;
	
	@Inject
	SubjectListDAOP dao;

	@GetMapping("lectureApplList")
	public String applList(@RequestParam Map<String, Object> detailCondition, Model model,
			@RealUser MemberVO mem
	){
			String memNo = mem.getMemNo();
			List<LecOpenListVO> lectureApplList = service.retrieveLectureApplList(memNo);
			model.addAttribute("lectureApplList", lectureApplList);
			model.addAttribute("memNo", memNo);
			model.addAttribute("condition", detailCondition);
			model.addAttribute("contentTitle", "강의 개설 신청");
		return "tiles:professor/info/lecture/lectureappl/lectureApplList";
	}
	
	@GetMapping("lectureApplDetail/{lolAppno}")
	public String applView(@PathVariable String lolAppno, Model model) {
		LecOpenListVO lecture = service.retrieveLectureAppl(lolAppno);
		model.addAttribute("lecture", lecture);
		return "professor/info/lecture/lectureappl/lectureApplDetail";
	}
	
	@ModelAttribute("lectureOpen")
	public LecOpenListVO lectureOpen() {
		return new LecOpenListVO();
	}
	
	
	@GetMapping("lectureApplInsertForm")
	public String applInsertForm(
		 Model model, @RealUser MemberVO mem
		) {
		String memNo = mem.getMemNo();
		String memName = mem.getMemName();
		List<Map<String, Object>> subjectList = dao.selectList();
		model.addAttribute("subjectList", subjectList);
		model.addAttribute("memNo", memNo);
		model.addAttribute("memName", memName);
		return "professor/info/lecture/lectureappl/lectureApplInsertForm";
		
	}
	
	@PostMapping("lectureApplInsertForm")
	public String applInsertProcess(
			@Validated({ InsertGroup.class, Default.class })
			@ModelAttribute("lectureOpen") LecOpenListVO vo,
			Errors errors, RedirectAttributes redirectAttributes, @RealUser MemberVO mem, Model model) {
		
		String logicalViewName = null;
		if (!errors.hasErrors()) {
			ServiceResult result = service.inserstLectureAppl(vo);
			String message = null;
			switch (result) {
			case OK:
				logicalViewName = "redirect:/professor/info/lecture/lectureappl/lectureApplList";
				break;
			default:
				logicalViewName = "professor/info/lecture/lectureappl/lectureApplInsertForm";
				message = "잘못된 정보 포함";
				break;
			}
			model.addAttribute("message", message);

		} else {
			logicalViewName = "professor/info/lecture/lectureappl/lectureApplInsertForm";
		}
		return logicalViewName;
	}
	
	@GetMapping("lectureApplEditForm/{lolAppno}")
	public String applEditForm(@PathVariable String lolAppno,@ModelAttribute("lectureOpen") LecOpenListVO vo, Model model,
			Errors errors, RedirectAttributes redirectAttributes
			) {
		LecOpenListVO lecture = service.retrieveLectureAppl(lolAppno);
		List<Map<String, Object>> subjectList = dao.selectList();
		model.addAttribute("subjectList", subjectList);
		model.addAttribute("lecture", lecture);
		return "professor/info/lecture/lectureappl/lectureApplEditForm";
	}
	
	@PostMapping("lectureApplEditForm")
	public String applEditProcess(
			@Validated({ UpdateGroup.class, Default.class })
			@ModelAttribute("lectureOpen") LecOpenListVO vo,
			Errors errors, RedirectAttributes redirectAttributes, Model model) {
		
		String logicalViewName = null;
		if (!errors.hasErrors()) {
			ServiceResult result = service.modifyLectureAppl(vo);
			String message = null;
			switch (result) {
			case OK:
				logicalViewName = "redirect:/professor/info/lecture/lectureappl/lectureApplList";
				break;
			default:
				logicalViewName = "professor/info/lecture/lectureappl/lectureApplEditForm";
				message = "잘못된 정보 포함";
				break;
			}
			model.addAttribute("message", message);

		} else {
			logicalViewName = "professor/info/lecture/lectureappl/lectureApplEditForm";
		}
		return logicalViewName;
	}
	
	@PostMapping("del")
	public String deleteProcess(@RequestParam String lolAppno, Model model, RedirectAttributes redirectAttributes) {
		service.removeLectureAppl(lolAppno);
		return "redirect:/professor/info/lecture/lectureappl/lectureApplList";
	}
}