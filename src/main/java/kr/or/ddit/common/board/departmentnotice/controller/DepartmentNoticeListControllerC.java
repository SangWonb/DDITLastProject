package kr.or.ddit.common.board.departmentnotice.controller;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.inject.Inject;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import kr.or.ddit.common.board.departmentnotice.service.DepartmentNoticeService;
import kr.or.ddit.utils.annotation.RealUser;
import kr.or.ddit.utils.paging.BootstrapFormBasePaginationRenderer;
import kr.or.ddit.utils.paging.PaginationInfo;
import kr.or.ddit.utils.paging.PaginationRenderer;
import kr.or.ddit.utils.paging.SearchCondition;
import kr.or.ddit.vo.common.CommunityVO;
import kr.or.ddit.vo.user.StudentVO;
import lombok.extern.slf4j.Slf4j;

@Slf4j
@Controller
@RequestMapping("/common/board/departmentnotice")
public class DepartmentNoticeListControllerC {
	
	@Inject
	DepartmentNoticeService service;

	@GetMapping("departmentNoticeList")
	public String list(			
			@RequestParam(name="page", required = false, defaultValue = "1") int currentPage
			, @RealUser StudentVO stu
			, @ModelAttribute("paging") PaginationInfo page
			, Model model	
		){
			PaginationInfo paging = new PaginationInfo(5,5);
			paging.setSimpleCondition(page.getSimpleCondition());
			paging.setCurrentPage(currentPage);
			paging.setDeptCode(stu.getDeptCode());

			List<CommunityVO> departmentNoticeList = service.retrieveDepartmentNoticeList(paging, stu.getDeptCode());
			
			PaginationRenderer renderer = new BootstrapFormBasePaginationRenderer("#submitForm");

			String pagingHTML = renderer.renderPagination(paging);
			
			model.addAttribute("departmentNoticeList", departmentNoticeList);
			model.addAttribute("pagingHTML", pagingHTML);
			model.addAttribute("contentTitle", "학과 공지사항");
		return "tiles:common/board/departmentnotice/departmentNoticeList";
	}
	
	@GetMapping("departmentNoticeDetail/{cmntCode}")
	public String detail(@PathVariable String cmntCode, Model model) {

		CommunityVO notice = service.retrieveDepartmentNotice(cmntCode);

		model.addAttribute("notice", notice);
		return "common/board/departmentnotice/departmentNoticeDetail";
	}
}
