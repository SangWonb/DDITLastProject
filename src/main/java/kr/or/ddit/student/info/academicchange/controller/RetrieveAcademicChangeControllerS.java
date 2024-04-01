package kr.or.ddit.student.info.academicchange.controller;

import java.util.List;

import javax.inject.Inject;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.Errors;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import kr.or.ddit.enumpkg.ServiceResult;
import kr.or.ddit.student.info.academicchange.service.AcademicChangeService;
import kr.or.ddit.student.info.mypage.service.MyPageSService;
import kr.or.ddit.utils.annotation.RealUser;
import kr.or.ddit.vo.info.AcademicClassificationVO;
import kr.or.ddit.vo.info.AcademicRecordChangeVO;
import kr.or.ddit.vo.user.MemberVO;
import kr.or.ddit.vo.user.StudentVO;
import lombok.extern.slf4j.Slf4j;


@Slf4j
@Controller
@RequestMapping("student/info/academicChange/")
public class RetrieveAcademicChangeControllerS {
	
	@Inject
	private AcademicChangeService service;
	
	@Inject
	private MyPageSService other;
	
	@GetMapping("list")
	public String list(
			@RealUser MemberVO mem
			,Model model	
	) {
		
		String memNo=mem.getMemNo();
		List<AcademicRecordChangeVO> record = service.retrieveAcaRecordList(memNo);
		
		StudentVO stuInfo = other.retrieveMyInfo(memNo);
		
		model.addAttribute("contentTitle", "학적변동신청");
		model.addAttribute("record",record);
		model.addAttribute("stuInfo",stuInfo);
		return "tiles:student/info/academicchange/academicChangeList";
	}
	
	@PostMapping("view")
	public String details(
	        Model model,
	        @RequestParam String arcNo
	) {
	    AcademicRecordChangeVO record = service.retrieveRecord(arcNo);

	    model.addAttribute("record", record);

	    return "tiles:student/info/academicchange/academicChangeView";

	}

	@PostMapping("delete")
	public String delete(@RequestParam String arcNo, Model model) {
		service.removeRecord(arcNo);
		return "redirect:/student/info/academicChange/list";
	}
	
//	@PostMapping("delete")
//	public String deleteOne(@RequestBody String arcNo) {
//		log.info("arcNo: {}", arcNo);
//		service.removeRecord(arcNo);
//		return "redirect:student/info/academicchange/academicChangeList";
//	}
	
	@GetMapping("acaForm")
	public String insertForm(
			@RealUser MemberVO mem,
			Model model
			) {
		String name=mem.getMemName();
		String memNo=mem.getMemNo();
		
		List<AcademicClassificationVO> acaType = service.retrieveAcademicType();
		
		model.addAttribute("name", name);
		model.addAttribute("memNo", memNo);
		model.addAttribute("acaType", acaType);
		
		return "tiles:student/info/academicchange/acaForm";
	}
	
	@PostMapping("acaForm")
	public String insertOne(
			@ModelAttribute AcademicRecordChangeVO newRecord
			,Errors errors
			,RedirectAttributes redirectAttributes
			,Model model
			) {
		String logicalViewName = null;
		
		log.info("newRecord:{}", newRecord);
		
		if(!errors.hasErrors()) {
			ServiceResult result=service.createRecord(newRecord);	
			String message = null;
			
			switch (result) {
			case OK:
				logicalViewName = "redirect:/student/info/academicChange/list";
				break;
			default:
				logicalViewName = "tiles:student/info/academicchange/acaForm";
				message = "잘못된 정보가 포함됨.";
				model.addAttribute("message", message);
				break;
			}

		}else {
			logicalViewName = "tiles:student/info/academicchange/acaForm";
		}
		return logicalViewName;
	}
	
	@GetMapping("acaEditForm")
	public String updateForm(
			Model model,
			@RequestParam String arcNo
			) {
		String name ="김차은";
		AcademicRecordChangeVO record = service.retrieveRecord(arcNo);
		
		model.addAttribute("record",record);
		model.addAttribute("name", name);
		
		
		return "tiles:student/info/academicchange/acaEdit";
	}
	
	@PostMapping("acaEditForm")
	public String updateOne(
			@ModelAttribute("newRecord") AcademicRecordChangeVO newRecord
			,Errors errors
			,RedirectAttributes redirectAttributes
			,Model model
			) {
		
		String logicalViewName = null;
		
		if(!errors.hasErrors()) {
			ServiceResult result=service.modifyRecord(newRecord);
			String message = null;
			
			switch (result) {
			case OK:
				logicalViewName = "redirect:/student/info/academicChange/list";
				break;
			default:
				logicalViewName = "tiles:student/info/academicchange/acaForm";
				message = "잘못된 정보가 포함됨.";
				model.addAttribute("message", message);
				break;
			}

		}else {
			logicalViewName = "tiles:student/info/academicchange/acaForm";
		}
		return logicalViewName;
	}
	
}
