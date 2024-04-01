package kr.or.ddit.professor.info.counsel.startcounsel.controller;

import java.util.List;

import javax.inject.Inject;
import javax.servlet.http.HttpServletRequest;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import kr.or.ddit.enumpkg.ServiceResult;
import kr.or.ddit.professor.info.counsel.startcounsel.service.CounselPService;
import kr.or.ddit.utils.annotation.RealUser;
import kr.or.ddit.vo.info.CounselVO;
import kr.or.ddit.vo.user.MemberVO;
import kr.or.ddit.vo.user.StudentVO;
import lombok.extern.slf4j.Slf4j;
import retrofit2.http.GET;

@Slf4j
@Controller
@RequestMapping("professor/info/counsel/startcounsel/")
public class RetrieveStartCounselControllerP {

	@Inject
	private CounselPService service;


	@GetMapping("startCounselList")
	public String list(
			@RealUser MemberVO mem,
			Model model
			) {
		String pmemNo = mem.getMemNo();
		List<CounselVO> counselList = service.retrieveCounselList(pmemNo);
		
		CounselVO couns = new CounselVO();
		
		couns.setCounsPro(pmemNo);
		couns.setCounsStatus("STA08");
		
		CounselVO count = service.retrieveCount(couns);
		
		model.addAttribute("counsel", counselList);
		model.addAttribute("count",count);
		
		return "tiles:professor/info/counsel/startcounsel/startCounselList";
	}
	
	@GetMapping("startCounselDetails")
	public String details(
			HttpServletRequest request
			,Model model
			) {
		String ip = request.getRemoteAddr();
		
		model.addAttribute("ip", ip);
		return "jsonView";
	}
	
	@GetMapping("selectStudent")
	public String studentInfo(
			@RequestParam String smemNo,
			Model model,
			@RealUser MemberVO mem
			) {
		StudentVO sInfo = service.retrieveStudent(smemNo);
		
		String pmemNo=mem.getMemNo();
		List<CounselVO> counselList = service.retrieveCounselList(pmemNo);
		
		model.addAttribute("sInfo", sInfo);
		model.addAttribute("counselList",counselList);
		return "jsonView";
	}
	
	@GetMapping("modCounsel")
	public String modCounsel(
		 @RequestParam String counsNo,
		 Model model
			) {
		ServiceResult result=service.modCounselDetail(counsNo);
		
		model.addAttribute("result", result);
		
		return "jsonView";
	}
	
	@PostMapping("saveJournal")
	public String counselJournal(
			 @RequestBody CounselVO saveCouns,
			 Model model
			) {
		ServiceResult result = service.modCounselJournal(saveCouns);
		
		model.addAttribute("result",result);
		
		return "jsonView";
	}
	
	@PostMapping("finalJournal")
	public String finalCounselJournal(
			 @RequestBody CounselVO finalCouns,
			 Model model
			) {
		
		ServiceResult result = service.modCounselJournal(finalCouns);
		
		model.addAttribute("result",result);
		
		return "jsonView";
	}
}
