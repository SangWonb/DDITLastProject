package kr.or.ddit.professor.cyber.grade.controller;

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

import kr.or.ddit.enumpkg.ServiceResult;
import kr.or.ddit.professor.cyber.attendance.service.AttendService;
import kr.or.ddit.professor.cyber.attendance.vo.AttendInfoVO;
import kr.or.ddit.professor.cyber.attendance.vo.DayVO;
import kr.or.ddit.professor.cyber.grade.service.GradeService;
import kr.or.ddit.professor.cyber.task.service.TaskService;
import kr.or.ddit.professor.cyber.teamproject.service.TeamProjectService;
import kr.or.ddit.utils.annotation.RealUser;
import kr.or.ddit.utils.paging.PaginationInfo;
import kr.or.ddit.utils.paging.PaginationRenderer;
import kr.or.ddit.utils.paging.TamplateFormBasePagingationRenderer;
import kr.or.ddit.vo.cyber.LecGradeCvtVO;
import kr.or.ddit.vo.cyber.LecturePlanVO;
import kr.or.ddit.vo.cyber.LectureVO;
import kr.or.ddit.vo.cyber.TaskSubmitVO;
import kr.or.ddit.vo.cyber.TaskVO;
import kr.or.ddit.vo.cyber.TeamProjectVO;
import kr.or.ddit.vo.cyber.TeamVO;
import kr.or.ddit.vo.user.ProfessorVO;
import kr.or.ddit.vo.user.StudentVO;

@Controller
@RequestMapping("professor/cyber/{lecCode}/grade")
public class GradeRetrieveControllerP {
	
	@Inject
	GradeService gService;
	@Inject
	AttendService aService;
	@Inject
	TaskService tskService;
	@Inject
	TeamProjectService tpService;
	
	@GetMapping
	public String gradeView(@PathVariable String lecCode, Model model, RedirectAttributes redirect) {
		
		if(!gService.gradeSeason()) {
			redirect.addFlashAttribute("message", "성적조회기간이 아닙니다.");
			return "redirect:/professor/cyber/syllabus/syllabusDetail/"+lecCode;	
		}
		
		model.addAttribute("contentTitle", "성적관리");
		return "tiles:professor/cyber/grade/gradeViewP";
	}
	
	@GetMapping("gradeList")
	public String gradeListData(
			@PathVariable String lecCode,
			@RequestParam(name="page", required = false, defaultValue = "1") int currentPage
			,Model model) {
		
		PaginationInfo paging = new PaginationInfo(10,3);
		paging.setCurrentPage(currentPage);
		
		List<LecGradeCvtVO> gradeList = gService.retrieveGradeList(lecCode, paging);
		LecturePlanVO lecturePlan = gService.retrieveLecturePlan(lecCode);
		int attendF = gService.retrieveAttendF(lecCode);
		
		PaginationRenderer renderer = new TamplateFormBasePagingationRenderer("#searchForm");
		String pagingHTML = renderer.renderPagination(paging);
		
		model.addAttribute("gradeList", gradeList);
		model.addAttribute("lecturePlan", lecturePlan);
		model.addAttribute("attendF", attendF);
		model.addAttribute("pagingHTML", pagingHTML);
		
		return "jsonView";
	}
	
	@GetMapping("updateGrade")
	public String updateGrade(@PathVariable String lecCode,Model model) {
		
		ServiceResult result = gService.modifyGradeList(lecCode);
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
	
	@GetMapping("detail")
	public String gradeViewDetail(@PathVariable String lecCode, Model model,@RequestParam String smemNo) {
		model.addAttribute("contentTitle", "성적상세관리");
		model.addAttribute("currentSmemNo", smemNo);
		return "tiles:professor/cyber/grade/gradeDetailP";
	}
	
	@GetMapping("detail/stuGradeData")
	public String stuGradeData(@PathVariable String lecCode, Model model,@RequestParam String smemNo) {
		
		LecGradeCvtVO stuGrade = gService.retrieveGrade(lecCode, smemNo);
		LecturePlanVO lecturePlan = gService.retrieveLecturePlan(lecCode);
		int attendF = gService.retrieveAttendF(lecCode);
		
		model.addAttribute("stuGrade", stuGrade);
		model.addAttribute("lecturePlan", lecturePlan);
		model.addAttribute("attendF", attendF);
		
		return "jsonView";
	}
	
	@GetMapping("detail/attendDetail")
	public String attendDetailData(@PathVariable String lecCode, Model model,@RequestParam String smemNo) {
		
		LecGradeCvtVO stuGrade = gService.retrieveGrade(lecCode, smemNo);
		StudentVO student = new StudentVO();
		student.setSmemNo(smemNo);
		student.setMemName(stuGrade.getMemName());
		student.setDeptName(stuGrade.getDeptName());
		
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
	
	@GetMapping("detail/taskDetail")
	public String taskDetailData(@PathVariable String lecCode, Model model,@RequestParam String smemNo) {
		
		List<TaskVO> taskListS = tskService.retrieveTaskListS(lecCode, "ST04", smemNo);
		
		for(TaskVO task : taskListS) {
			TaskSubmitVO taskSubmit = tskService.retrieveTaskSubmit(task.getTaskCode(), smemNo);
			task.setTaskSubmit(taskSubmit);
		}
		model.addAttribute("taskListS", taskListS);
		
		return "jsonView";
	}
	
	@GetMapping("detail/teamProjectDetail")
	public String teamProjectDetailData(@PathVariable String lecCode, Model model,@RequestParam String smemNo) {
		
		List<TeamProjectVO> projectListS = tpService.retrieveTeamProjectListS(lecCode, "ST04", smemNo);
		
		for(TeamProjectVO tp : projectListS) {
			TeamVO team = tpService.retrieveTeam(tp.getTeamNo());
			tp.setTeam(team);
		}
		model.addAttribute("projectListS", projectListS);
		
		return "jsonView";
	}
	
	@GetMapping("detail/testDetail")
	public String testDetailData(@PathVariable String lecCode, Model model,@RequestParam String smemNo) {
		
		LecGradeCvtVO stuTest = gService.retrieveTest(lecCode, smemNo);
		model.addAttribute("stuTest", stuTest);
		
		return "jsonView";
	}
	
	
	
	
}
