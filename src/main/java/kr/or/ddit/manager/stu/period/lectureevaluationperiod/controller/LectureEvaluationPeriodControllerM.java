package kr.or.ddit.manager.stu.period.lectureevaluationperiod.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
@RequestMapping("/manager/stu/period/lectureevaluationperiod/lectureEvaluationPeriodList")
public class LectureEvaluationPeriodControllerM {

	@GetMapping
	public String list() {
		
		return "tiles:manager/stu/period/lectureevaluationperiod/lectureEvaluationPeriodList";
	}
}
