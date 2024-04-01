package kr.or.ddit.student.info.certificate.controller;

import java.util.List;
import java.util.Map;

import javax.inject.Inject;

import org.springframework.http.MediaType;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import kr.or.ddit.student.info.certificate.service.CertificateServiceS;
import kr.or.ddit.utils.annotation.RealUser;
import kr.or.ddit.utils.paging.BootstrapFormBasePaginationRenderer;
import kr.or.ddit.utils.paging.PaginationInfo;
import kr.or.ddit.utils.paging.PaginationRenderer;
import kr.or.ddit.vo.common.BookVO;
import kr.or.ddit.vo.info.CertificateRecVO;
import kr.or.ddit.vo.info.CertificateVO;
import kr.or.ddit.vo.user.MemberVO;
import kr.or.ddit.vo.user.StudentVO;
import lombok.extern.slf4j.Slf4j;

@Slf4j
@Controller
@RequestMapping("/student/info/certificate/")
public class RetrieveCertificateS {
	
	@Inject
	private CertificateServiceS service;
	
	@GetMapping("certificateList")
	public String certificateList(
			@RequestParam Map<String, Object> detailCondition
			, @RequestParam(name="page", required = false, defaultValue = "1") int currentPage
			, Model model
			, @RealUser MemberVO mem
		) {
		
			String memNo = mem.getMemNo();
			List<StudentVO> stuRecord = service.selectRecord(memNo);
			List<CertificateRecVO> crtiAllList = service.selectCertifiRecList(memNo);
			
			PaginationInfo paging = new PaginationInfo(1,3);
			
			paging.setCurrentPage(currentPage);
			paging.setDetailCondition(detailCondition);
			
			PaginationRenderer renderer = new BootstrapFormBasePaginationRenderer("#submitForm");

			String pagingHTML = renderer.renderPagination(paging);
			
			model.addAttribute("pagingHTML", pagingHTML);
			model.addAttribute("crtiAllList",crtiAllList);
			model.addAttribute("condition", detailCondition);
			model.addAttribute("contentTitle", "증명서발급");
			model.addAttribute("stuRecord", stuRecord);
			
			List<CertificateVO> selectCrtfList = service.selectCrtfList();
			model.addAttribute("selectCrtfList",selectCrtfList);
			log.info("selectCrtfList : {}",selectCrtfList);
			
		return "tiles:student/info/certificate/certificateList";
	}
	
	@GetMapping(value = "jsonbookList", produces = MediaType.APPLICATION_JSON_VALUE)
	@ResponseBody
	public Model certificateRecData(
	    @RealUser MemberVO mem, // 실제 사용자 정보를 가져오는 어노테이션 사용
	    Model model
	){
	    String memNo = mem.getMemNo(); // 사용자 학번 가져오기
	    List<CertificateRecVO> certiRecList = service.selectCertifiRecList(memNo);
	    model.addAttribute("certiRecList", certiRecList);
	    return model;
	}
	
	@PostMapping("saveCertificateInfo")
	@ResponseBody
	public String saveCertificateInfo(
			@RequestBody CertificateRecVO newRec,
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
