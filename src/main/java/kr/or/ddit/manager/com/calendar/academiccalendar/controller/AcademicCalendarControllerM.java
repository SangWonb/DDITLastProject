package kr.or.ddit.manager.com.calendar.academiccalendar.controller;

import java.util.List;

import javax.inject.Inject;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;

import kr.or.ddit.enumpkg.ServiceResult;
import kr.or.ddit.manager.com.calendar.academiccalendar.service.AcaCalendarService;
import kr.or.ddit.utils.annotation.RealUser;
import kr.or.ddit.vo.common.CalendarVO;
import kr.or.ddit.vo.user.MemberVO;
import lombok.extern.slf4j.Slf4j;

@Slf4j
@Controller
@RequestMapping("manager/info/acaCalendar")
public class AcademicCalendarControllerM {
	
	
	@Inject
	private AcaCalendarService service;
	
	@GetMapping
	public String calendar() {
		
		return "tiles:manager/com/calendar/academiccalendar/acaCalendar";
	}
	
    @GetMapping("getInfo")
    public String main( Model model) {
    	
    	List<CalendarVO> aList= service.retrieveAList();
    	model.addAttribute("aList", aList);
    	
    	return "jsonView";
    }
    
    
  
    @PostMapping("saveInfo")
    public String saveInfo(
    		Model model,
    		@RequestBody CalendarVO newInfo,
    		@RealUser MemberVO mem
    		) {
    	
    	String memNo = mem.getMemNo();
    	
    	newInfo.setMemNo(memNo);
    	
    	log.info("여기여기여기 캘린더:{}",newInfo);
    	
    	ServiceResult result = service.addNewInfo(newInfo);
    	
    	model.addAttribute("result", result);
    	
    	return "jsonView";
    }
    
    @PostMapping("delInfo")
    public String deleteInfo(
    		@RequestBody String cldrCode,
    		Model model
    		) {
    	log.info("여기다 이자시강 : {}",cldrCode);
    	
    	ServiceResult result = service.removeInfo(cldrCode);
    	model.addAttribute("result", result);
    	
    	return "jsonView";
    }
}
