package kr.or.ddit.manager.com.board.academicnotice.controller;

import java.util.List;
import java.util.Map;

import javax.inject.Inject;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.validation.annotation.Validated;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import kr.or.ddit.enumpkg.ServiceResult;
import kr.or.ddit.manager.com.board.academicnotice.service.AcademicNoticeServiceM;
import kr.or.ddit.utils.annotation.RealUser;
import kr.or.ddit.utils.paging.BootstrapFormBasePaginationRenderer;
import kr.or.ddit.utils.paging.PaginationInfo;
import kr.or.ddit.utils.paging.PaginationRenderer;
import kr.or.ddit.validate.InsertGroup;
import kr.or.ddit.validate.UpdateGroup;
import kr.or.ddit.vo.common.CommunityVO;
import kr.or.ddit.vo.user.MemberVO;

@Controller
@RequestMapping("/manager/com/board/academicnotice")
public class AcademicNoticeControllerM {

	@Inject
	AcademicNoticeServiceM service;
	
	@GetMapping("academicNotice")
	public String list(			
			@RequestParam(name="page", required = false, defaultValue = "1") int currentPage
			, @ModelAttribute("paging") PaginationInfo page
			, Model model	
		){
			PaginationInfo paging = new PaginationInfo(10,3);
			
			paging.setCurrentPage(currentPage);
			paging.setSimpleCondition(page.getSimpleCondition());
			
			List<CommunityVO> academicNoticeList = service.retrieveAcademicNoticeList(paging);
			
			PaginationRenderer renderer = new BootstrapFormBasePaginationRenderer("#submitForm");

			String pagingHTML = renderer.renderPagination(paging);
			
			model.addAttribute("academicNoticeList", academicNoticeList);
			model.addAttribute("pagingHTML", pagingHTML);
			model.addAttribute("contentTitle", "학교 공지사항");
		return "tiles:manager/com/board/academicnotice/academicNotice";
	}

	@GetMapping("academicNoticeDetail/{cmntCode}")
	public String detail(@PathVariable String cmntCode, Model model) {
		CommunityVO notice = service.retrieveAcademicNotice(cmntCode);
		model.addAttribute("notice", notice);
		return "manager/com/board/academicnotice/academicNoticeDetail";
	}
	
	@GetMapping("academicNoticeInsertForm")
	public String insertForm(Model model, @RealUser MemberVO mem) {
		String memNo = mem.getMemNo();
		String memName = mem.getMemName();
		model.addAttribute("memNo", memNo);
		model.addAttribute("memName", memName);
	    return "manager/com/board/academicnotice/academicNoticeInsertForm";
	}
	
	@PostMapping("academicNoticeInsertForm")
	public String insertProcess(
		@RealUser MemberVO mem,
	    @Validated(InsertGroup.class) 
	    @ModelAttribute ("notice") CommunityVO notice,
	    BindingResult errors,
	    Model model
	) {
		notice.setMemNo(mem.getMemNo());
	    String logicalViewName = null;
	    if (!errors.hasErrors()) {
	        ServiceResult result = service.createAcademicNotice(notice);
	        String message = null;
	        switch (result) {
	            case OK:
	                logicalViewName = "redirect:/manager/com/board/academicnotice/academicNotice";
	                break;
	            default:
	                logicalViewName = "manager/com/board/academicnotice/academicNoticeInsertForm";
	                message = "다시 입력 바람";
	                break;
	        }
	        model.addAttribute("message", message);
	    } else {
	        logicalViewName = "manager/com/board/academicnotice/academicNoticeInsertForm";
	    }
	    return logicalViewName;
	}
	
	
	// 업데이트 폼
	@GetMapping("academicNoticeEditForm/{cmntCode}")
	public String editForm(@PathVariable String cmntCode, Model model) {
		CommunityVO notice = service.retrieveAcademicNotice(cmntCode);
		model.addAttribute("notice", notice);
	    return "manager/com/board/academicnotice/academicNoticeEditForm";
	}
	
	// 업데이트 처리
	@PostMapping("academicNoticeEditForm")
	public String update(
	    @Validated(UpdateGroup.class) 
	    @ModelAttribute ("notice") CommunityVO notice,
	    BindingResult errors,
	    Model model
	) {
	    String logicalViewName = null;
	    if (!errors.hasErrors()) {
	        ServiceResult result = service.modifyAcademicNotice(notice);
	        String message = null;
	        switch (result) {
	            case OK:
	                logicalViewName = "redirect:/manager/com/board/academicnotice/academicNotice";
	                break;
	            default:
	                logicalViewName = "manager/com/board/academicnotice/academicNoticeEditForm";
	                message = "다시 입력 바람";
	                break;
	        }
	        model.addAttribute("message", message);
	    } else {
	        logicalViewName = "manager/com/board/academicnotice/academicNoticeEditForm";
	    }
	    return logicalViewName;
	}
	
	@PostMapping("del")
	public String delete(@RequestParam String cmntCode, Model model) {
		service.removeAcademicNotice(cmntCode);
		return "redirect:/manager/com/board/academicnotice/academicNotice";
	}
}
