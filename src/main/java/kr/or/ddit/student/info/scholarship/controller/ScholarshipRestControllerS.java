package kr.or.ddit.student.info.scholarship.controller;

import java.util.List;
import java.util.Map;

import javax.inject.Inject;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import kr.or.ddit.student.info.scholarship.service.ScholarshipService;
import kr.or.ddit.utils.annotation.RealUser;
import kr.or.ddit.vo.info.ScholashipRecVO;
import kr.or.ddit.vo.user.MemberVO;

@Controller
@RequestMapping("/student/info/scholarship")
public class ScholarshipRestControllerS {
	
	@Inject
	ScholarshipService service;

	//전체 장학금 조회
	@GetMapping("scholarshipList")
	public String list(
		@RequestParam Map<String, Object> detailCondition
		, @RealUser MemberVO mem
		, Model model	
	){
		
		List<ScholashipRecVO> scholashipList = service.retrieveScholashipRecList(mem.getMemNo());
		
		model.addAttribute("scholashipList", scholashipList);
		model.addAttribute("condition", detailCondition);
		model.addAttribute("contentTitle", "장학금");
		
		return "tiles:student/info/scholarship/scholarshipList";
	}
}