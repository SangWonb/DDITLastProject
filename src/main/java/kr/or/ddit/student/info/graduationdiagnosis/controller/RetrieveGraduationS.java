package kr.or.ddit.student.info.graduationdiagnosis.controller;

import javax.inject.Inject;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import kr.or.ddit.student.info.graduationdiagnosis.service.GraduationServiceS;
import kr.or.ddit.utils.annotation.RealUser;
import kr.or.ddit.vo.cyber.DepartmentVO;
import kr.or.ddit.vo.user.MemberVO;
import kr.or.ddit.vo.user.StudentVO;
import lombok.extern.slf4j.Slf4j;

@Slf4j
@Controller
@RequestMapping("/student/info/graduationdiagnosis/")
public class RetrieveGraduationS {
	
	@Inject
	private GraduationServiceS service;
	
	@GetMapping("graduationList")
	public String graduationList(
		Model model
		, @RealUser MemberVO mem
	){
		String memNo = mem.getMemNo();
		
		DepartmentVO depcord = service.selectGradList(memNo);
        StudentVO stuRecord = service.selectStuGradList(memNo);
        
        log.info("depcord : {}",depcord);
        log.info("stuRecord : {}",stuRecord);
        
        model.addAttribute("depcord", depcord);
        model.addAttribute("stuRecord", stuRecord);
		model.addAttribute("contentTitle", "졸업자가진단");
		
		return "tiles:student/info/graduationdiagnosis/graduationList";
	}
	
}
