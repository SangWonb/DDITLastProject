package kr.or.ddit.manager.stu.criteria.attendancecriteria.controller;

import java.util.List;

import javax.inject.Inject;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;

import kr.or.ddit.enumpkg.ServiceResult;
import kr.or.ddit.manager.stu.criteria.attendancecriteria.service.AttendCriteriaService;
import kr.or.ddit.vo.cyber.AttendVO;
import kr.or.ddit.vo.info.AttendCriteriaVO;
import lombok.extern.slf4j.Slf4j;

@Slf4j
@Controller
@RequestMapping("/manager/stu/criteria/attendancecriteria")
public class AttendanceCriteriaControllerM {
	
	@Inject
	AttendCriteriaService service;
	
	@GetMapping
	public String list(Model model) {
		model.addAttribute("contentTitle", "출결기준등록");
		return "tiles:manager/stu/criteria/attendancecriteria/attendanceCriteriaM";
	}
	
	@GetMapping("attendCriteriaData")
	public String attendCriteriaData(Model model) {
		
		List<AttendCriteriaVO> attendCriteria = service.retrieveAttendCriteria();
		model.addAttribute("attendCriteria", attendCriteria);
		
		return "jsonView";
	}
	
	@PostMapping("/attendCriteriaDataEdit")
	public String attendCriteriaDataEdit(@RequestBody List<AttendCriteriaVO> attendCriteriaDataEdit, Model model) {
		
		log.info("\n\n\n\n\n\n==== attendDataEdit ====\n\n{}\n\n\n\n\n",attendCriteriaDataEdit);
		
		ServiceResult result = service.modifyAttendCriteria(attendCriteriaDataEdit);
		
		switch (result) {
		case OK:
			model.addAttribute("success", true);
			break;

		default:
			model.addAttribute("success", false);
			break;
		}
		
		return "jsonView";
	}
	
}
