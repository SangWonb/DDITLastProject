package kr.or.ddit.common.portlet.controller;

import java.util.List;

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

import kr.or.ddit.common.board.academicnotice.service.AcademicNoticeService;
import kr.or.ddit.common.book.popularbook.service.PopularBookService;
import kr.or.ddit.common.book.service.BookService;
import kr.or.ddit.common.portlet.service.PortletSaveService;
import kr.or.ddit.common.service.PortletServiceC;
import kr.or.ddit.student.careerup.employment.employmentagency.service.EmploymentAgencyServiceS;
import kr.or.ddit.student.careerup.employment.employmenteducation.service.EmployProgramServiceS;
import kr.or.ddit.student.info.scholarship.service.ScholarshipService;
import kr.or.ddit.utils.annotation.RealUser;
import kr.or.ddit.utils.paging.PaginationInfo;
import kr.or.ddit.vo.careerup.EmployProgramVO;
import kr.or.ddit.vo.careerup.EmploymentPlaceVO;
import kr.or.ddit.vo.common.BookRentalVO;
import kr.or.ddit.vo.common.CommunityVO;
import kr.or.ddit.vo.common.PortletVO;
import kr.or.ddit.vo.cyber.LectureApplyVO;
import kr.or.ddit.vo.info.ScholashipRecVO;
import kr.or.ddit.vo.user.MemberVO;
import lombok.extern.slf4j.Slf4j;

@Slf4j
@Controller
@RequestMapping("/common/portlet")
public class PortletControllerC {

	@Inject
	PortletSaveService service;
	
	@Inject
	private PortletServiceC portService;
	@Inject
	private PopularBookService services;
	@Inject
	AcademicNoticeService serviceAca;
	@Inject
	ScholarshipService serviceSch;
	@Inject
	EmploymentAgencyServiceS serviceEmp;
	@Inject
	EmployProgramServiceS servicePro;
	
	
	@GetMapping("setPortlet")
	public String go(Model model,
			@RealUser MemberVO mem,
			@RequestParam(name="page", required = false, defaultValue = "1") int currentPage
) {
		PaginationInfo paging = new PaginationInfo(5,5);
		List<ScholashipRecVO> retrieveScholashipRecList = serviceSch.retrieveScholashipRecList(mem.getMemNo());
		List<EmploymentPlaceVO> retrieveEmploymentAgencyList = serviceEmp.retrieveEmploymentAgencyListForPo();
		List<EmployProgramVO> retrieveEmployProgramList = servicePro.retrieveEmployProgramListForPo();
		log.info("여기1{}",retrieveScholashipRecList);
		log.info("여기2{}",retrieveEmploymentAgencyList);
		List<BookRentalVO> popBook = services.retrievePopBook();
    	
    	model.addAttribute("popBook",popBook);
		model.addAttribute("schList", retrieveScholashipRecList);
		model.addAttribute("empList", retrieveEmploymentAgencyList);
		model.addAttribute("proList", retrieveEmployProgramList);
		return "common/portlet/setPortlet";
	}
	
	@PostMapping(value="setPortlet", produces =  MediaType.APPLICATION_JSON_VALUE)
	public String save(
			@RequestBody PortletVO[] por,
			@RealUser MemberVO mem
			) {
		
		String memNo = mem.getMemNo();
		portService.removeMember(memNo); // 삭제
		log.info("@@@@@@@@@@@@@@@@{}@@@@@@@@@@@@@@",memNo);
		
	    for (PortletVO po : por) {
	        po.setMemNo(memNo);
	    }
	    service.createPortlet(por);
	    log.info("요깅{}" ,por);
		return "common/portlet/setPortlet";
		
	}
}
