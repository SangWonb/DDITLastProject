package kr.or.ddit.manager.stats.lectureevaluation.controller;

import java.time.LocalDate;

import javax.inject.Inject;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;

import kr.or.ddit.student.cyber.lectureevaluation.service.LecSurveyService;
import kr.or.ddit.vo.cyber.LecSurveyResultVO;
import lombok.extern.slf4j.Slf4j;

@Slf4j
@Controller
@RequestMapping("/manager/state/lectureevaluation")
public class LectureEvaluationController {

	@Inject
	LecSurveyService lsService;
	
	@GetMapping
	public String list(Model model) {
		model.addAttribute("contentTitle", "강의평가통계");
		LecSurveyResultVO thisLSR = lsService.retrieveYearLSR(LocalDate.now().getYear());
		LecSurveyResultVO lastLSR = lsService.retrieveYearLSR(LocalDate.now().getYear()-1);
		
		
		model.addAttribute("thisYear", LocalDate.now().getYear());
		model.addAttribute("lastYear", LocalDate.now().getYear()-1);
		model.addAttribute("thisLSR", thisLSR);
		model.addAttribute("lastLSR", lastLSR);
		return "tiles:manager/state/lectureevaluation/lectureEvaluationViewM";
	}
	
	@GetMapping("thisLastLecEvalAvg")
	public String lecEvalAvg(Model model) {
		
		LecSurveyResultVO thisLSR = lsService.retrieveYearLSR(LocalDate.now().getYear());
		LecSurveyResultVO lastLSR = lsService.retrieveYearLSR(LocalDate.now().getYear()-1);
		
		model.addAttribute("thisYear", LocalDate.now().getYear());
		model.addAttribute("lastYear", LocalDate.now().getYear()-1);
		model.addAttribute("thisLSR", thisLSR);
		model.addAttribute("lastLSR", lastLSR);
		
		return "jsonView";
	}
	
}
