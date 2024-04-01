package kr.or.ddit.manager.stu.period.objectionapplperiod.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
@RequestMapping("/manager/stu/objectionapplpreiod/objectionApplPreiodList")
public class ObjectionApplPreiodListControllerM {

	public String list() {
		
		return "tiles:manager/stu/objectionapplpreiod/objectionApplPreiodList";
	}
}
