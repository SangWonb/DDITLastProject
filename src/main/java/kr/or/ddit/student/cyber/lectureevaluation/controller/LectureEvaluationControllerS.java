package kr.or.ddit.student.cyber.lectureevaluation.controller;

import java.util.List;

import javax.inject.Inject;
import javax.servlet.annotation.HttpMethodConstraint;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import kr.or.ddit.enumpkg.ServiceResult;
import kr.or.ddit.student.cyber.lectureevaluation.service.LecSurveyService;
import kr.or.ddit.utils.annotation.RealUser;
import kr.or.ddit.vo.cyber.LecSurveyContentVO;
import kr.or.ddit.vo.cyber.LecSurveyResultVO;
import kr.or.ddit.vo.cyber.TaskSubmitVO;
import kr.or.ddit.vo.user.StudentVO;
import lombok.extern.slf4j.Slf4j;

@Slf4j
@Controller
@RequestMapping("/student/cyber/{lecCode}/lectureevaluation")
public class LectureEvaluationControllerS {
	
	@Inject
	LecSurveyService lsService;
	
	@GetMapping
	public String list(@PathVariable String lecCode, Model model, @RealUser StudentVO student, RedirectAttributes redirect) {
		
		if(!lsService.lecEvalSeason()) {
			redirect.addFlashAttribute("message", "강의평가 기간이 아닙니다.");
			return "redirect:/student/cyber/syllabus/syllabusDetail/"+lecCode;	
		}
		
		LecSurveyResultVO lsr = lsService.retrieveLSR(lecCode, student.getSmemNo());
		model.addAttribute("contentTitle", "강의평가");
		model.addAttribute("lsr", lsr);
		return "tiles:student/cyber/lectureevaluation/lectureEvaluationMainS";
	}
	
	@GetMapping("start")
	public String lectureEvaluationUI(Model model) {
		
		List<LecSurveyContentVO> lscList = lsService.retrieveLSCList();
		
		model.addAttribute("contentTitle", "강의평가");
		model.addAttribute("lscList", lscList);		
		return "tiles:student/cyber/lectureevaluation/lectureEvaluationViewS";
	}
	
	@GetMapping("start/LSCData")
	public String lscData(Model model) {
		List<LecSurveyContentVO> lscList = lsService.retrieveLSCList();
		model.addAttribute("lscList", lscList);		
		return "jsonView";
	}
	
	@PostMapping("start/LSCSubmit")
	public String lscSubmit(@PathVariable String lecCode,@RequestBody List<LecSurveyContentVO> lscList, Model model, @RealUser StudentVO student) {
		ServiceResult result = lsService.createLSR(lscList,lecCode,student.getSmemNo());
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
