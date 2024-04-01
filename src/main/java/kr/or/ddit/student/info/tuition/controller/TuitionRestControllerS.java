package kr.or.ddit.student.info.tuition.controller;

import java.util.List;
import java.util.Map;

import javax.inject.Inject;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import kr.or.ddit.student.info.tuition.service.TuitionServiceS;
import kr.or.ddit.utils.annotation.RealUser;
import kr.or.ddit.vo.info.EnrollInvoiceVO;
import kr.or.ddit.vo.user.MemberVO;
import kr.or.ddit.vo.user.StudentVO;

@Controller
@RequestMapping("/student/info/tuition")
public class TuitionRestControllerS {
	
	@Inject
	TuitionServiceS service;

	@GetMapping("tuitionList")
	public String list(
			@RequestParam Map<String, Object> detailCondition
			, @RealUser MemberVO mem
			, @RealUser StudentVO stu
			, Model model
		){
		String memNo = mem.getMemNo();
		String deptCode = stu.getDeptCode();	
		List<EnrollInvoiceVO> enrollInvoiceList = 
				service.retrieveEnrollInvoiceList(memNo,deptCode);
		
		model.addAttribute("enrollInvoiceList", enrollInvoiceList);
		model.addAttribute("condition", detailCondition);
		model.addAttribute("contentTitle", "등록금");
		return "tiles:student/info/tuition/tuitionList";
	}
	
	@GetMapping("tuitionDetail/{enrlNo}")
	public String detail(@PathVariable String enrlNo, Model model){
		EnrollInvoiceVO enrollInvoice = service.retrieveEnrollInvoice(enrlNo);
		model.addAttribute("enrollInvoice", enrollInvoice);
		model.addAttribute("contentTitle", "등록금");
		return "student/info/tuition/tuitionDetail";
	}
	
	@GetMapping("tuitionBillForm/{enrlNo}")
	public String billForm(@PathVariable String enrlNo, Model model,
			@RealUser MemberVO mem ){
		String memName = mem.getMemName();
		String memNo = mem.getMemNo();
		String deptName = mem.getDeptName();
		String colName = mem.getColName();
		
		EnrollInvoiceVO enrollInvoice = service.retrieveEnrollInvoice(enrlNo);
		
		model.addAttribute("enrollInvoice", enrollInvoice);
		model.addAttribute("memName", memName);
		model.addAttribute("memNo", memNo);
		model.addAttribute("deptName", deptName);
		model.addAttribute("colName", colName);
		return "student/info/tuition/tuitionBillForm";
	}
}