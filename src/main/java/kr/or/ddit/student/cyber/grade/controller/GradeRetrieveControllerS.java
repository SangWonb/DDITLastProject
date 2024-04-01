package kr.or.ddit.student.cyber.grade.controller;

import java.util.List;
import java.util.Map;

import javax.inject.Inject;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import kr.or.ddit.professor.cyber.attendance.service.AttendService;
import kr.or.ddit.professor.cyber.attendance.vo.AttendInfoVO;
import kr.or.ddit.professor.cyber.attendance.vo.DayVO;
import kr.or.ddit.professor.cyber.grade.service.GradeService;
import kr.or.ddit.professor.cyber.task.service.TaskService;
import kr.or.ddit.professor.cyber.teamproject.service.TeamProjectService;
import kr.or.ddit.student.cyber.lectureevaluation.service.LecSurveyService;
import kr.or.ddit.utils.annotation.RealUser;
import kr.or.ddit.vo.cyber.LecGradeCvtVO;
import kr.or.ddit.vo.cyber.LecSurveyResultVO;
import kr.or.ddit.vo.user.StudentVO;
import kr.or.ddit.vo.cyber.LecturePlanVO;
import kr.or.ddit.vo.cyber.TaskSubmitVO;
import kr.or.ddit.vo.cyber.TaskVO;
import kr.or.ddit.vo.cyber.TeamProjectVO;
import kr.or.ddit.vo.cyber.TeamVO;

@Controller
@RequestMapping("student/cyber/{lecCode}/grade")
public class GradeRetrieveControllerS {
	
	@Inject
	GradeService gService;
	@Inject
	AttendService aService;
	@Inject
	TaskService tskService;
	@Inject
	TeamProjectService tpService;
	@Inject
	LecSurveyService lsService;
	
	@GetMapping
	public String gradeView(@PathVariable String lecCode, Model model, @RealUser StudentVO student, RedirectAttributes redirect) {
		
		LecSurveyResultVO lsr = lsService.retrieveLSR(lecCode, student.getSmemNo());
		if(lsr == null) {
			redirect.addFlashAttribute("message", "강의평가 진행 이후에 성적조회가 가능합니다.");
			return "redirect:/student/cyber/syllabus/syllabusDetail/"+lecCode;	
		}
		
		if(!gService.gradeSeason()) {
			redirect.addFlashAttribute("message", "성적조회기간이 아닙니다.");
			return "redirect:/student/cyber/syllabus/syllabusDetail/"+lecCode;	
		}
		
		LecGradeCvtVO stuGrade = gService.retrieveGrade(lecCode, student.getSmemNo());
		if(stuGrade.getLgcCode() == null) {
			redirect.addFlashAttribute("message", "아직 성적산출이 완료되지 않았습니다.");
			return "redirect:/student/cyber/syllabus/syllabusDetail/"+lecCode;
		}
		
		model.addAttribute("contentTitle", "성적조회");
		return "tiles:student/cyber/grade/gradeViewS";
	}
	
	@GetMapping("stuGradeData")
	public String stuGradeData(@PathVariable String lecCode, Model model, @RealUser StudentVO student) {
		
		LecGradeCvtVO stuGrade = gService.retrieveGrade(lecCode, student.getSmemNo());
		LecturePlanVO lecturePlan = gService.retrieveLecturePlan(lecCode);
		int attendF = gService.retrieveAttendF(lecCode);
		
		model.addAttribute("stuGrade", stuGrade);
		model.addAttribute("lecturePlan", lecturePlan);
		model.addAttribute("attendF", attendF);
		
		return "jsonView";
	}
	
	@GetMapping("attendDetail")
	public String attendDetailData(@PathVariable String lecCode, Model model,@RealUser StudentVO student) {
		
		Map<String, Object> findSchoolDayInfo = aService.findSchoolDayInfo(lecCode);
		Map<String, Integer> weekMap = (Map<String, Integer>) findSchoolDayInfo.get("weekMap");//주차별 수업일수
		List<DayVO> dayvoList = (List<DayVO>) findSchoolDayInfo.get("dayvoList");//수업일수 정보
		int conducted = (int) findSchoolDayInfo.get("conducted");//실시일수
		AttendInfoVO attendInfo = aService.retrieveAttendInfo(lecCode, student);
		int classCount = aService.retrieveClassCount(lecCode);
		
		model.addAttribute("weekMap", weekMap);
		model.addAttribute("dayvoList", dayvoList);
		model.addAttribute("conducted", conducted);
		model.addAttribute("attendInfo", attendInfo);
		model.addAttribute("classCount", classCount);
		
		return "jsonView";
	}
	
	@GetMapping("taskDetail")
	public String taskDetailData(@PathVariable String lecCode, Model model,@RealUser StudentVO student) {
		
		List<TaskVO> taskListS = tskService.retrieveTaskListS(lecCode, "ST04", student.getSmemNo());
		
		for(TaskVO task : taskListS) {
			TaskSubmitVO taskSubmit = tskService.retrieveTaskSubmit(task.getTaskCode(), student.getSmemNo());
			task.setTaskSubmit(taskSubmit);
		}
		model.addAttribute("taskListS", taskListS);
		
		return "jsonView";
	}
	
	@GetMapping("teamProjectDetail")
	public String teamProjectDetailData(@PathVariable String lecCode, Model model,@RealUser StudentVO student) {
		
		List<TeamProjectVO> projectListS = tpService.retrieveTeamProjectListS(lecCode, "ST04", student.getSmemNo());
		
		for(TeamProjectVO tp : projectListS) {
			TeamVO team = tpService.retrieveTeam(tp.getTeamNo());
			tp.setTeam(team);
		}
		model.addAttribute("projectListS", projectListS);
		
		return "jsonView";
	}
	
	@GetMapping("testDetail")
	public String testDetailData(@PathVariable String lecCode, Model model,@RealUser StudentVO student) {
		
		LecGradeCvtVO stuTest = gService.retrieveTest(lecCode, student.getSmemNo());
		model.addAttribute("stuTest", stuTest);
		
		return "jsonView";
	}
}
