package kr.or.ddit.professor.info.certificate.controller;

import java.util.List;

import javax.inject.Inject;

import org.springframework.http.MediaType;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import kr.or.ddit.professor.info.certificate.service.CertificateServiceP;
import kr.or.ddit.utils.annotation.RealUser;
import kr.or.ddit.vo.info.CertificatePVO;
import kr.or.ddit.vo.info.CertificateRecPVO;
import kr.or.ddit.vo.info.CertificateRecVO;
import kr.or.ddit.vo.user.MemberVO;
import kr.or.ddit.vo.user.ProfessorVO;
import lombok.extern.slf4j.Slf4j;

@Slf4j
@Controller
@RequestMapping("/professor/info/certificate/")
public class RetrieveCertificateP {
	
	@Inject
	private CertificateServiceP service;
	
	@GetMapping("certificateList")
	public String list(
		Model model
		, @RealUser MemberVO mem
	){
		String memNo = mem.getMemNo();
		ProfessorVO proRecord = service.selectRecord(memNo);
		List<CertificateRecPVO> crtiAllList = service.selectCertifiRecList(memNo);
		
		model.addAttribute("crtiAllList",crtiAllList);
		model.addAttribute("contentTitle", "증명서발급");
		model.addAttribute("proRecord",proRecord);
		
		List<CertificatePVO> selectCrtfList = service.selectCrtfList();
		model.addAttribute("selectCrtfList",selectCrtfList);
		log.info("selectCrtfList : {}",selectCrtfList);
		
		return "tiles:professor/info/certificate/certificateList";
	}
	
	@GetMapping(value = "jsonbookList", produces = MediaType.APPLICATION_JSON_VALUE)
	@ResponseBody
	public Model certificateRecData(
	    @RealUser MemberVO mem, // 실제 사용자 정보를 가져오는 어노테이션 사용
	    Model model
	){
	    String memNo = mem.getMemNo(); // 사용자 학번 가져오기
	    List<CertificateRecPVO> certiRecList = service.selectCertifiRecList(memNo);
	    model.addAttribute("certiRecList", certiRecList);
	    return model;
	}
	
	@PostMapping("saveCertificateInfo")
	@ResponseBody
	public String saveCertificateInfo(
			@RequestBody CertificateRecPVO newRec,
			@RealUser MemberVO mem
			) {
		 String memNo = mem.getMemNo(); 
		 newRec.setMemNo(memNo);
		
		log.info("newRec : {}",newRec);
	    try {
	        // 서비스 레이어 호출하여 데이터베이스 작업 수행
	        service.insertCrtfRec(newRec);
	        log.info("newRec22222 : {}",newRec);
	        return "success";
	    } catch (Exception e) {
	        e.printStackTrace();
	        return "error";
	    }
	}
	
}
