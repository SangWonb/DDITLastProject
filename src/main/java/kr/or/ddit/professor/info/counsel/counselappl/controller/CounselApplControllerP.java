package kr.or.ddit.professor.info.counsel.counselappl.controller;

import java.util.List;

import javax.inject.Inject;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.method.support.ModelAndViewContainer;

import kr.or.ddit.enumpkg.ServiceResult;
import kr.or.ddit.professor.info.counsel.counselappl.service.CounselAppPService;
import kr.or.ddit.utils.annotation.RealUser;
import kr.or.ddit.vo.info.CounselVO;
import kr.or.ddit.vo.user.MemberVO;

@Controller
@RequestMapping("professor/info/counsel/counselappl/")
public class CounselApplControllerP {

	@Inject
	private CounselAppPService service;
	
	@GetMapping("counselApplList")
	public String list(
			@RealUser MemberVO mem,
			Model model
			) {
		String pmemNo=mem.getMemNo();
		
		List<CounselVO> list = service.retrieveList(pmemNo);
		int total = service.retrievetWaitingCount(pmemNo);
		
		model.addAttribute("list", list);
		model.addAttribute("total",total);
		
		return "tiles:professor/info/counsel/counselappl/counselApplList";
	}
	
	@GetMapping("counselAppDetail")
	public String detail(
			@RealUser MemberVO mem,
			Model model,
			@RequestParam String counsAppno
			) {
		
		CounselVO detail = service.retrieveDetail(counsAppno);
		
		model.addAttribute("detail", detail);
		
		return "jsonView";
	}
	
	@PostMapping("modCounsel")
	public String modCounsel(
			@RequestBody CounselVO counsel,
			Model model
			) {
		
		ServiceResult result = service.modCounsel(counsel);
		
		model.addAttribute("result", result);
		
		return "jsonView";
	}
	
}
