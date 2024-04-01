package kr.or.ddit.manager.stu.mentor.controller;

import java.util.List;
import java.util.Map;

import javax.inject.Inject;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.validation.annotation.Validated;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import kr.or.ddit.enumpkg.ServiceResult;
import kr.or.ddit.manager.stu.mentor.service.MentorApplListServiceM;
import kr.or.ddit.student.careerup.licenserecom.dao.DeptAndSeniorDAO;
import kr.or.ddit.validate.BywGroup;
import kr.or.ddit.vo.careerup.SeniorCoworkerVO;
import kr.or.ddit.vo.user.StudentVO;

@Controller
@RequestMapping("/manager/stu/mentor")
public class MentorListController {
	
	@Inject
	MentorApplListServiceM service;
	
	@Inject
	DeptAndSeniorDAO dao;

	@GetMapping("mentorList")
	public String list(			
			Model model	
		){
			List<StudentVO> mentorAppl = service.retrieveApplList();
			
			model.addAttribute("mentorAppl", mentorAppl);
			model.addAttribute("contentTitle", "멘토 신청목록");
		return "tiles:manager/stu/mentor/mentorList";
	}

	@GetMapping("mentorApplInsertForm/{smemNo}")
	public String insertForm(@PathVariable String smemNo, Model model) {
		List<Map<String, Object>> selectSeniorCompanyTypeList = dao.selectSeniorCompanyTypeList();
		StudentVO appl = service.retrieveAppl(smemNo);
		model.addAttribute("appl", appl);
		model.addAttribute("companyTypeList", selectSeniorCompanyTypeList);
	    return "manager/stu/mentor/mentorApplInsertForm";
	}
	
	@PostMapping("mentorApplInsertForm")
	public String insertProcess(
	    @Validated(BywGroup.class)
	    SeniorCoworkerVO vo,
	    BindingResult errors,
	    Model model
	) {
	    String logicalViewName = null;
	    if (!errors.hasErrors()) {
	        ServiceResult result = service.createMentor(vo);
	        String message = null;
	        switch (result) {
	            case OK:
	                logicalViewName = "redirect:/manager/stu/mentor/mentorList";
	                break;
	            default:
	                logicalViewName = "manager/stu/mentor/mentorApplInsertForm";
	                message = "다시 입력 바람";
	                break;
	        }
	        model.addAttribute("message", message);
	    } else {
	        logicalViewName = "manager/stu/mentor/mentorApplInsertForm";
	    }
	    return logicalViewName;
	}
	
	@PostMapping("del")
	public String edit(String smemNo, Model model) {
		service.modifyApplDel(smemNo);
		return "redirect:/manager/stu/mentor/mentorList";
	}
}