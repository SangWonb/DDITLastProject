package kr.or.ddit.professor.cyber.attendance.controller;

import java.util.List;
import java.util.Map;

import javax.inject.Inject;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;

import kotlin.coroutines.jvm.internal.DebugMetadata;
import kr.or.ddit.enumpkg.ServiceResult;
import kr.or.ddit.professor.cyber.attendance.service.AttendService;
import kr.or.ddit.professor.cyber.attendance.vo.AttendInfoVO;
import kr.or.ddit.professor.cyber.attendance.vo.DayVO;
import kr.or.ddit.vo.cyber.AttendVO;
import kr.or.ddit.vo.user.StudentVO;
import lombok.extern.slf4j.Slf4j;
import retrofit2.http.PartMap;

@Slf4j
@Controller
@RequestMapping("professor/cyber/{lecCode}/attendance")
public class AttendanceControllerP {
	
	@Inject
	AttendService service;
	
	@GetMapping
	public String attendanceView(@PathVariable String lecCode, Model model) {
		model.addAttribute("contentTitle", "출결관리");
		return "tiles:professor/cyber/attendance/attendanceViewP";
	}
	
	@GetMapping("attendData")
	public String attendData(@PathVariable String lecCode, Model model) {
		
		
		Map<String, Object> findSchoolDayInfo = service.findSchoolDayInfo(lecCode);
		
		Map<String, Integer> weekMap = (Map<String, Integer>) findSchoolDayInfo.get("weekMap");//주차별 수업일수
		List<DayVO> dayvoList = (List<DayVO>) findSchoolDayInfo.get("dayvoList");//수업일수 정보
		int conducted = (int) findSchoolDayInfo.get("conducted");//실시일수
		List<StudentVO> studentList = service.retrieveStudentList(lecCode);
		List<AttendInfoVO> attendInfoList = service.retrieveAttendInfoList(lecCode);
		
		model.addAttribute("weekMap", weekMap);
		model.addAttribute("dayvoList", dayvoList);
		model.addAttribute("conducted", conducted);
		model.addAttribute("studentList", studentList);
		model.addAttribute("attendInfoList", attendInfoList);
		
		
		for(AttendInfoVO attendInfo: attendInfoList) {
			log.info("\n\n\n\n\n\n\n\n====attendInfo====\n{}\n\n\n\n\n\n\n",attendInfo);
		}
		
		return "jsonView";
	}
	
	@PostMapping("/attendDataEdit")
	public String attendDataEdit(@PathVariable String lecCode, @RequestBody List<AttendVO> attendDataEdit, Model model) {
		
		log.info("\n\n\n\n\n\n==== attendDataEdit ====\n\n{}\n\n\n\n\n",attendDataEdit);
		for(AttendVO attend : attendDataEdit) {
			attend.setLecCode(lecCode);
			attend.setAttendDateString(attend.getAtDate().toString());
		}
		
		ServiceResult result = service.modifyAttendList(attendDataEdit);
		
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








