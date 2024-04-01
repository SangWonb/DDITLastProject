package kr.or.ddit.manager.stu.volunteer.volunteerhistory.contoller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
@RequestMapping("/manager/stu/volunteer/volunteerhistory/volunteerHistoryList")
public class VolunteerHistoryListController {

	@GetMapping
	public String list() {
		return "tiles:manager/stu/volunteer/volunteerhistory/volunteerHistoryList";
	}
}
