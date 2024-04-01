package kr.or.ddit.student.cyber.attendance.controller;

import java.util.List;
import java.util.Map;

import javax.inject.Inject;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;

import kr.or.ddit.professor.cyber.attendance.service.AttendService;
import kr.or.ddit.professor.cyber.attendance.vo.AttendInfoVO;
import kr.or.ddit.professor.cyber.attendance.vo.DayVO;
import kr.or.ddit.utils.annotation.RealUser;
import kr.or.ddit.vo.user.StudentVO;

@Controller
@RequestMapping("student/cyber/{lecCode}/attendance")
public class AttendanceRetrieveControllerS {
	
	@Inject
	AttendService service;
	
	@GetMapping
	public String attendanceView(@PathVariable String lecCode, Model model) {
		model.addAttribute("contentTitle", "출결관리");
		return "tiles:student/cyber/attendance/attendanceViewS";
	}
	
	@GetMapping("attendData")
	public String attendData(@PathVariable String lecCode, Model model, @RealUser StudentVO student) {
		
		
		Map<String, Object> findSchoolDayInfo = service.findSchoolDayInfo(lecCode);
		
		Map<String, Integer> weekMap = (Map<String, Integer>) findSchoolDayInfo.get("weekMap");//주차별 수업일수
		List<DayVO> dayvoList = (List<DayVO>) findSchoolDayInfo.get("dayvoList");//수업일수 정보
		int conducted = (int) findSchoolDayInfo.get("conducted");//실시일수
		AttendInfoVO attendInfo = service.retrieveAttendInfo(lecCode, student);
		int classCount = service.retrieveClassCount(lecCode);
		
		model.addAttribute("weekMap", weekMap);
		model.addAttribute("dayvoList", dayvoList);
		model.addAttribute("conducted", conducted);
		model.addAttribute("attendInfo", attendInfo);
		model.addAttribute("classCount", classCount);
		
		return "jsonView";
	}

}
