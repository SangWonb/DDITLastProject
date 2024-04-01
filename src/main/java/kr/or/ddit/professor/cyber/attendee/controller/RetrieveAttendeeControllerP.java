package kr.or.ddit.professor.cyber.attendee.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
@RequestMapping("professor/cyber/attendee/")
public class RetrieveAttendeeControllerP {
	
	@GetMapping("attendeeDetails")
	public String details(){
		return"professor/cyber/attendee/attendeeDetails";
	}
	
	@GetMapping("attendeeList")
	public String list() {
		return "professor/cyber/attendee/attendeeList";
	}
}
