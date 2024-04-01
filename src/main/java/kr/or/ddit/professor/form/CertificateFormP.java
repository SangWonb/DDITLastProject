package kr.or.ddit.professor.form;

import java.util.List;

import javax.inject.Inject;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import kr.or.ddit.enumpkg.ServiceResult;
import kr.or.ddit.professor.info.certificate.service.CertificateServiceP;
import kr.or.ddit.utils.annotation.RealUser;
import kr.or.ddit.vo.info.CertificateGnoPVO;
import kr.or.ddit.vo.info.CertificateGnoVO;
import kr.or.ddit.vo.user.MemberVO;
import kr.or.ddit.vo.user.ProfessorVO;
import lombok.extern.slf4j.Slf4j;

@Controller
@RequestMapping("/professor/form/")
@Slf4j
public class CertificateFormP {
	
	@Inject
	private CertificateServiceP service;
	
	@GetMapping("/crtfForm")
	public String certificateForm(
        Model model,
        @RequestParam("docType") String docType,
        @RequestParam("crtfPRecno") String crtfPRecno,
        @RequestParam("crtfPQtypt") String crtfPQtypt,
        @RealUser MemberVO mem
	) {
        log.info("docType★★★★★★★★★ : {}", docType);
        log.info("crtfPRecno★★★★★★★★ : {}", crtfPRecno);
        log.info("crtfPQtypt★★★★★★★★ : {}", crtfPQtypt);
        
        String memNo = mem.getMemNo();
        ProfessorVO proRecord = service.selectRecord(memNo);
        
        model.addAttribute("proRecord",proRecord);
        
    	int crtfPtInt = Integer.parseInt(crtfPQtypt);
        
        String redirectPage = null; // 리다이렉트 페이지를 저장하기 위한 변수
        
        for (int i = 1; i < crtfPtInt + 1; i++) {
            ServiceResult result = service.insertCrtfGno(crtfPRecno);
            if (result == ServiceResult.OK) {
                // 인쇄매수 업데이트
                ServiceResult updateResult = service.updateCrtfRec(crtfPRecno);
                if (updateResult != ServiceResult.OK) {
                    // 업데이트에 실패한 경우
                    redirectPage = "errorPage";
                    break; // 중단하고 에러 페이지로 리다이렉트
                }

                // 증명서 유형에 따라 적절한 페이지로 리다이렉트
                if (docType.equals("CEP01")) {
                    // 재직증명서 증명서
                    redirectPage = "student/form/certificateFormEmployment";
                } else {
                    // 유효하지 않은 증명서 유형 처리
                    redirectPage = "errorPage";
                }
            } else {
                // 인쇄매수 삽입에 실패한 경우
                redirectPage = "errorPage";
                break; //  중단하고 에러 페이지로 리다이렉트
            }
        }
        
        CertificateGnoPVO cerVo = new CertificateGnoPVO();
        cerVo.setCrtfPRecno(crtfPRecno);
        cerVo.setCrtfPQtypt(crtfPtInt);

        List<CertificateGnoPVO> gno = service.selectGno(cerVo);
        model.addAttribute("gno", gno);
        // 적절한 페이지로 리다이렉트
        return (redirectPage != null) ? redirectPage : "errorPage";
    }
	
}
