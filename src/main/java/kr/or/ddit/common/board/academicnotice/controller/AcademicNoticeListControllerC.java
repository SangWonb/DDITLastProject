package kr.or.ddit.common.board.academicnotice.controller;

import java.util.List;

import javax.inject.Inject;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import kr.or.ddit.common.board.academicnotice.service.AcademicNoticeService;
import kr.or.ddit.utils.paging.BootstrapFormBasePaginationRenderer;
import kr.or.ddit.utils.paging.PaginationInfo;
import kr.or.ddit.utils.paging.PaginationRenderer;
import kr.or.ddit.vo.common.CommunityVO;
import lombok.extern.slf4j.Slf4j;

@Slf4j
@Controller
@RequestMapping("/common/board/academicnotice")
public class AcademicNoticeListControllerC {
	
	@Inject
	AcademicNoticeService service;
	
	@GetMapping("academicNotice")
	public String list(			
			 @RequestParam(name="page", required = false, defaultValue = "1") int currentPage
			, Model model, @ModelAttribute("paging") PaginationInfo page
		){
			PaginationInfo paging = new PaginationInfo(10,5);
			paging.setCurrentPage(currentPage);
			paging.setSimpleCondition(page.getSimpleCondition());
			
			List<CommunityVO> academicNoticeList = service.retrieveAcademicNoticeList(paging);
			
			PaginationRenderer renderer = new BootstrapFormBasePaginationRenderer("#submitForm");

			String pagingHTML = renderer.renderPagination(paging);
			
			model.addAttribute("academicNoticeList", academicNoticeList);
			model.addAttribute("pagingHTML", pagingHTML);
			model.addAttribute("contentTitle", "학교 공지사항");
		return "tiles:common/board/academicnotice/academicNotice";
	}

	@GetMapping("academicNoticeDetail/{cmntCode}")
	public String detail(@PathVariable String cmntCode, Model model) {

		CommunityVO notice = service.retrieveAcademicNotice(cmntCode);

		model.addAttribute("notice", notice);
		return "common/board/academicnotice/academicNoticeDetail";
	}
}
