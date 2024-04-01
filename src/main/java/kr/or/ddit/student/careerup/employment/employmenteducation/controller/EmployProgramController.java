package kr.or.ddit.student.careerup.employment.employmenteducation.controller;

import java.util.List;

import javax.inject.Inject;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.Errors;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import kr.or.ddit.enumpkg.ServiceResult;
import kr.or.ddit.student.careerup.employment.employmenteducation.service.EmployProgramServiceS;
import kr.or.ddit.utils.annotation.RealUser;
import kr.or.ddit.utils.paging.BootstrapFormBasePaginationRenderer;
import kr.or.ddit.utils.paging.PaginationInfo;
import kr.or.ddit.utils.paging.PaginationRenderer;
import kr.or.ddit.vo.careerup.ApplVO;
import kr.or.ddit.vo.careerup.EmployProgramVO;
import kr.or.ddit.vo.user.MemberVO;
import lombok.extern.slf4j.Slf4j;

@Slf4j
@Controller
@RequestMapping("/student/careerup/employment/employmenteducation")
public class EmployProgramController {
	
	@Inject
	EmployProgramServiceS service;
	
	@GetMapping("employmentEducationList")
	public String programList(			
			 @RequestParam(name="page", required = false, defaultValue = "1") int currentPage
			, Model model	
			, @ModelAttribute("paging") PaginationInfo page
		){
			PaginationInfo paging = new PaginationInfo(5,5);
			
			paging.setCurrentPage(currentPage);
			paging.setSimpleCondition(page.getSimpleCondition());
			
			List<EmployProgramVO> employProgramList = service.retrieveEmployProgramList(paging);
			
			PaginationRenderer renderer = new BootstrapFormBasePaginationRenderer("#submitForm");

			String pagingHTML = renderer.renderPagination(paging);
			
			model.addAttribute("employProgramList", employProgramList);
			model.addAttribute("pagingHTML", pagingHTML);
			model.addAttribute("contentTitle", "취업 교육 프로그램");
		return "tiles:student/careerup/employment/employmenteducation/employmentEducationList";
	}
	
	@GetMapping("employmentEducationDetail/{emppgCode}")
	public String programView(@PathVariable String emppgCode, Model model){
		EmployProgramVO employProgram = service.retrieveEmployProgram(emppgCode);
		
		model.addAttribute("employProgram", employProgram);
		return "student/careerup/employment/employmenteducation/employmentEducationDetail";
	}
	
	//////////// 신청 관련 메소드
	
	@GetMapping("employProgramApplList")
	public String applList(@RealUser MemberVO mem, Model model){
		List<ApplVO> employProgramApplList = service.retrieveApplList(mem.getMemNo());
		model.addAttribute("employProgramApplList", employProgramApplList);
		return "student/careerup/employment/employmenteducation/employProgramApplList";
	}
	
	@GetMapping("employProgramApplDetail/{appl}")
	public String applView(@PathVariable String appl, Model model){
		ApplVO employProgramAppl = service.retrieveAppl(appl);
		model.addAttribute("employProgramAppl", employProgramAppl);
		return "student/careerup/employment/employmenteducation/employmentEducationDetail";
	}
	
	@PostMapping("employProgramApplForm")
	public String isnertOne(
			@ModelAttribute("newRecord") ApplVO appl
			, Errors errors
			, RedirectAttributes redirectAttributes
			, @RealUser MemberVO mem
			, @RequestParam String applCode
			, Model model
		){
		String logicalViewName = null;
		if(!errors.hasErrors()) {
			appl.setMemNo(mem.getMemNo());
			appl.setApplCode(applCode);
			ServiceResult result=service.createAppl(appl);
			String message = null;
			switch (result) {
			case OK:
				logicalViewName = "redirect:/student/careerup/employment/employmenteducation/employmentEducationList";
				break;
			default:
				logicalViewName = "student/careerup/employment/employmenteducation/employProgramApplForm";
				message = "잘못된 정보가 포함됨.";
				model.addAttribute("message", message);
				break;
			}

		}else {
			logicalViewName = "student/careerup/employment/employmenteducation/employProgramApplForm";
		}
		return logicalViewName;
	}
	
	@PostMapping("employProgramApplList/{appl}")
	public String deleteProcess(@PathVariable String appl, Model model, RedirectAttributes redirectAttributes) {
		ServiceResult cnt = service.removeAppl(appl);
		model.addAttribute("cnt", cnt);
		return "redirect:/student/careerup/employment/employmenteducation/employProgramApplList";
	}
}