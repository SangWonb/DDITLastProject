package kr.or.ddit.student.careerup.licenserecom.dao;

import java.util.List;
import java.util.Map;

import javax.inject.Inject;

import org.springframework.web.bind.annotation.ModelAttribute;

public class DeptAndSeniorController {
	@Inject
	private DeptAndSeniorDAO dao;
	
	@ModelAttribute("deptList")
	public List<Map<String, Object>> addDeptList() {
		return dao.selectDeptList();
	}
	
	@ModelAttribute("seniorJobList")
	public List<Map<String, Object>> addSeniorJobList() {
		return dao.selectSeniorJobList();
	}
}
