package kr.or.ddit.common.info.calendar.controller;

import java.util.List;

import javax.inject.Inject;

import org.intellij.lang.annotations.RegExp;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import kr.or.ddit.common.info.calendar.dao.CalendarDAO;
import kr.or.ddit.common.info.calendar.service.CalendarService;
import kr.or.ddit.utils.annotation.RealUser;
import kr.or.ddit.vo.common.CalendarVO;
import kr.or.ddit.vo.user.MemberVO;
import lombok.extern.slf4j.Slf4j;

@Slf4j
@Controller
@RequestMapping("common/info/calendar/Calendar")
public class CalendarController {
	
	@Inject
	private CalendarService service;
	
	@GetMapping
	public String scheduleList(
			@RealUser MemberVO mem,
			Model model
			) {
	
		List<CalendarVO> result = service.retrieveScheduleSaved(mem);
		log.info("result:{}",result);
		
		model.addAttribute("result", result);

		return "tiles:common/info/calendar/academiccalendar/academicCalendar";
	}
	
	@GetMapping("/schedule")
	public String deptList(
			@RealUser MemberVO mem,
			@RequestParam("type") String type,
			Model model
			) {
		
		String memNo = mem.getMemNo();
		mem.setMemSchedule(type);
		log.info("type:{}", type);
		
		List<CalendarVO> result=null;
		
		switch (type) {
		case "a":
			result = service.retrieveScheduleA();
			break;
		case "d":
			result = service.retrieveScheduleD(memNo);
			break;
		default:
			result = service.retrieveScheduleSaved(mem);
			break;
		}
		
		model.addAttribute("result", result);
		
		return "jsonView";
	}
	
//	@GetMapping("/info")
//	public String List(
//			@RealUser MemberVO mem,
//			@RequestParam("a") String a,
//			@RequestParam("d") String d,
//			Model model
//			) {
//		
//		if()
//		
//		return "jsonView";
//	}
	
//	@GetMapping("/insertSchesule")
//	public String insertSche() {
//		return "";
//	}

}
