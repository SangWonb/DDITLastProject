package kr.or.ddit.manager.stu.studentinfo.controller;

import java.util.List;
import java.util.Map;

import javax.inject.Inject;

import org.springframework.stereotype.Controller;
import org.springframework.stereotype.Service;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import kr.or.ddit.manager.stu.studentinfo.service.StudentListService;
import kr.or.ddit.utils.paging.BootstrapFormBasePaginationRenderer;
import kr.or.ddit.utils.paging.PaginationInfo;
import kr.or.ddit.utils.paging.PaginationRenderer;
import kr.or.ddit.vo.info.AcademicRecordChangeVO;
import kr.or.ddit.vo.info.CounselVO;
import kr.or.ddit.vo.info.EnrollInvoiceVO;
import kr.or.ddit.vo.info.ScholashipRecVO;
import kr.or.ddit.vo.user.MemberVO;
import lombok.extern.slf4j.Slf4j;

/**
 * 학생 수업이수, 상담이력, 등록금이력, 장학금이력을 한번에 조회
 */
@Slf4j
@Controller
@RequestMapping("/manager/stu/studentinfo/")
public class StudentInfoController {

	@Inject
	StudentListService service;
	
	@GetMapping("studentInfoList")
	public String list(
			@RequestParam Map<String, Object> detailCondition
			, @RequestParam(name="page", required = false, defaultValue = "1") int currentPage
			,Model model
			) {
		PaginationInfo paging = new PaginationInfo(10,5);
		
		PaginationRenderer renderer = new BootstrapFormBasePaginationRenderer("#submitForm");
		
		String pagingHTML = renderer.renderPagination(paging);
		
		paging.setCurrentPage(currentPage);
		paging.setDetailCondition(detailCondition);
		
		List<MemberVO> result = service.retrieveStudentList(paging);
		
		model.addAttribute("contentTitle", "학생조회");
		model.addAttribute("result", result);
		model.addAttribute("pagingHTML", pagingHTML);
		model.addAttribute("condition", detailCondition);
		
		return "tiles:manager/stu/studentinfo/studentInfoList";
	}
	
	@GetMapping("{memNo}")
	public String details(
			@PathVariable("memNo") String memNo,
			Model model
			) {
		log.info("memNo",memNo);
		
		List<CounselVO> couns=service.retrieveCounsList(memNo);
		MemberVO detail=service.retrieveDetail(memNo);
		List<EnrollInvoiceVO> enroll=service.retrieveEnrollList(memNo);
		List<ScholashipRecVO> scholar=service.retrieveScholaList(memNo);
		List<AcademicRecordChangeVO> aca = service.retrieveAcademicList(memNo);
		
		model.addAttribute("aca", aca);
		model.addAttribute("scholar", scholar);
		model.addAttribute("enroll", enroll);
		model.addAttribute("detail", detail);
		model.addAttribute("couns", couns);
		
		return "tiles:manager/stu/studentinfo/studentDetail";
	
	}
}
