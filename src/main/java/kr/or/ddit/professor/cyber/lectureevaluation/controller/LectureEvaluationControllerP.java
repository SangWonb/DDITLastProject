package kr.or.ddit.professor.cyber.lectureevaluation.controller;

import javax.inject.Inject;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;

import kr.or.ddit.professor.cyber.attendance.dao.AttendDAO;
import kr.or.ddit.professor.cyber.grade.dao.GradeDAO;
import kr.or.ddit.student.cyber.lectureevaluation.service.LecSurveyService;
import kr.or.ddit.vo.cyber.LecSurveyResultVO;

@Controller
@RequestMapping("professor/cyber/{lecCode}/lectureevaluation")
public class LectureEvaluationControllerP {
	
	@Inject
	LecSurveyService lsService;
	@Inject
	GradeDAO gDao;
	
	@GetMapping
	public String lectureEvaluationView(@PathVariable String lecCode, Model model) {
		model.addAttribute("contentTitle", "강의평가");
		return "tiles:professor/cyber/lectureevaluation/lectureEvaluationViewP";
	}
	
	@GetMapping("evalAvg")
	public String lecEvalAvg(@PathVariable String lecCode, Model model) {
		int totalStudent = gDao.selectTotalRecord(lecCode);
		LecSurveyResultVO evalAvg = lsService.evalAvg(lecCode);
		int evalStudentCount = lsService.evalStudentCount(lecCode);
		model.addAttribute("totalStudent", totalStudent);
		model.addAttribute("evalStudentCount", evalStudentCount);
		model.addAttribute("evalAvg", evalAvg);
		return "jsonView";
	}
	
}
