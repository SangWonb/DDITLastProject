package kr.or.ddit.student.careerup.licenseauto.controller;

import java.time.LocalDate;
import java.time.format.DateTimeFormatter;
import java.util.Map;

import javax.inject.Inject;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import kr.or.ddit.enumpkg.ServiceResult;
import kr.or.ddit.student.careerup.licenseauto.service.LicenseAutoService;
import kr.or.ddit.utils.annotation.RealUser;
import kr.or.ddit.vo.careerup.LicenseEnrollVO;
import kr.or.ddit.vo.user.StudentVO;
import lombok.extern.slf4j.Slf4j;

@Slf4j
@Controller
@RequestMapping("/student/careerup/licenseauto/licenseAuto")
public class LicenseAutoControllerS {
	
	@Inject
	LicenseAutoService service;
	
	@GetMapping
	public String licenseAutoView(Model model) {
		model.addAttribute("contentTitle", "AI 자격증 자동 등록");
		return "tiles:student/careerup/licenseauto/licenseAuto";
	}
	
	@PostMapping("licenseAdd")
	public String licenseAdd(@RequestParam Map<String, Object> license, Model model, @RealUser StudentVO student) {
		
		LicenseEnrollVO licenseEnroll = new LicenseEnrollVO();
		licenseEnroll.setSmemNo(student.getSmemNo());
		licenseEnroll.setLicenDate(StringToDataString((String) license.get("licenDate")));
		licenseEnroll.setLicenNo((String) license.get("licenNo"));
		licenseEnroll.setLicenCode((String) license.get("licenCode"));
		
		ServiceResult result = service.createLicenseAuto(licenseEnroll);
		
		switch (result) {
		case OK:
			model.addAttribute("success", true);
			break;
		default:
			model.addAttribute("success", false);
			break;
		}
		
		return "jsonView";
	
	}
	
	@PostMapping("findCode")
	public String findLicenCode(@RequestParam String licenNm, Model model) {
		
		log.info("\n\n\n\n\n\n\n\n======= licenNm =======\n{}\n\n\n\n\n\n\n\n",licenNm);
		String licenCode = service.findLicenseCode(licenNm);
		
		log.info("\n\n\n\n\n\n\n\n======= licenCode =======\n{}\n\n\n\n\n\n\n\n",licenCode);
		if(licenCode == null) {
			model.addAttribute("success", false);
		}else {
			model.addAttribute("success", true);
			model.addAttribute("licenCode", licenCode);				
		}
		
		return "jsonView";
	}
	
	/**
	 * 2024-01-01 >> 24/01/01
	 * @param string
	 * @return
	 */
	public String StringToDataString (String stringDate) {
		
		String yy = stringDate.substring(2,4);
		String mm = stringDate.substring(5,7);
		String dd = stringDate.substring(8,10);
		
		String ymd = yy + "/" + mm + "/" + dd;
		return ymd;
	}
	
}

