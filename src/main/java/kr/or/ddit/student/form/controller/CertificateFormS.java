package kr.or.ddit.student.form.controller;


import java.util.List;

import javax.inject.Inject;
import javax.servlet.http.HttpSession;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import kr.or.ddit.enumpkg.ServiceResult;
import kr.or.ddit.student.info.certificate.service.CertificateServiceS;
import kr.or.ddit.utils.annotation.RealUser;
import kr.or.ddit.vo.info.CertificateGnoPVO;
import kr.or.ddit.vo.info.CertificateGnoVO;
import kr.or.ddit.vo.user.MemberVO;
import kr.or.ddit.vo.user.StudentVO;
import lombok.extern.slf4j.Slf4j;

@Controller
@RequestMapping("/student/form/")
@Slf4j
public class CertificateFormS {
    
    @Inject
    private CertificateServiceS service;

    // 세션에 저장할 속성명
    private static final String SESSION_ATTRIBUTE_DATA = "certificateFormData";
    
    @PostMapping(value="certificateForm", produces = "text/plain;charset=UTF-8")
    @ResponseBody
    public String certificateForm(@RequestBody String innerHTML, HttpSession session) {
        // 세션에 데이터 저장
        session.setAttribute(SESSION_ATTRIBUTE_DATA, innerHTML);
        log.info("innerHTML : {}", innerHTML);
        return "convertToPdf";
    }
    
    @GetMapping("/crtfForm")
    public String certificateForm(
        Model model,
        @RequestParam("docType") String docType,
        @RequestParam("crtfRecno") String crtfRecno,
        @RequestParam("crtfQtypt") String crtfQtypt,
        @RealUser MemberVO mem
    ) {
        log.info("docType : {}", docType);
        log.info("crtfRecno : {}", crtfRecno);
        log.info("crtfQtypt : {}", crtfQtypt);
        
        String memNo = mem.getMemNo();
        List<StudentVO> stuRecord = service.selectRecord(memNo);
        model.addAttribute("stuRecord", stuRecord);
        
        int crtfPtInt = Integer.parseInt(crtfQtypt);
        
        String redirectPage = null; // 리다이렉트 페이지를 저장하기 위한 변수

        for (int i = 1; i < crtfPtInt + 1; i++) {
            ServiceResult result = service.insertCrtfGno(crtfRecno);
            if (result == ServiceResult.OK) {
                // 인쇄매수 업데이트
                ServiceResult updateResult = service.updateCrtfRec(crtfRecno);
                if (updateResult != ServiceResult.OK) {
                    // 업데이트에 실패한 경우
                    redirectPage = "errorPage";
                    break; // 중단하고 에러 페이지로 리다이렉트
                }

                // 증명서 유형에 따라 적절한 페이지로 리다이렉트
                if (docType.equals("CE01")) {
                    // 교육비납입 증명서
                    redirectPage = "student/form/certificateFormPayment";
                } else if (docType.equals("CE02")) {
                    // 성적 증명서
                    redirectPage = "student/form/certificateFormScore";
                } else if (docType.equals("CE03")) {
                    // 졸업 증명서
                    redirectPage = "student/form/certificateForm";
                } else if (docType.equals("CE04")) {
                    // 재학 증명서
                    redirectPage = "student/form/certificateFormEnrollment";
                } else {
                    // 유효하지 않은 증명서 유형 처리
                    redirectPage = "errorPage";
                }
            } else {
                // 인쇄매수 삽입에 실패한 경우
                redirectPage = "errorPage";
                break; // 중단하고 에러 페이지로 리다이렉트
            }
        }

        CertificateGnoVO cerVo = new CertificateGnoVO();
        cerVo.setCrtfRecno(crtfRecno);
        cerVo.setCrtfQtypt(crtfPtInt);

        List<CertificateGnoVO> gno = service.selectGno(cerVo);
        model.addAttribute("gno", gno);
        
        // 적절한 페이지로 리다이렉트
        return (redirectPage != null) ? redirectPage : "errorPage";
    }
	
}
//파라미터로 받음 : 신청증명서 vo
//증명서 한번 조회 차감 , 남은맷수를 확인(검증)해야함
//잔여횟수를 조회했는데 남지 않으면 인쇄 x
