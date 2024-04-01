package kr.or.ddit.manager.com.board.departmentnotice.controller;

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
import kr.or.ddit.manager.com.board.departmentnotice.service.DepartmentServiceM;
import kr.or.ddit.student.careerup.licenserecom.dao.DeptAndSeniorDAO;
import kr.or.ddit.utils.annotation.RealUser;
import kr.or.ddit.utils.paging.BootstrapFormBasePaginationRenderer;
import kr.or.ddit.utils.paging.PaginationInfo;
import kr.or.ddit.utils.paging.PaginationRenderer;
import kr.or.ddit.validate.InsertGroup;
import kr.or.ddit.validate.UpdateGroup;
import kr.or.ddit.vo.common.CommunityVO;
import kr.or.ddit.vo.user.MemberVO;

@Controller
@RequestMapping("/manager/com/board/departmentnotice")
public class DepartmentNoticeControllerM {

	@Inject
	DepartmentServiceM service;
	
	@Inject
	DeptAndSeniorDAO dao;
	
	@GetMapping("departmentNoticeList")
	public String list(			
			@RequestParam(name="page", required = false, defaultValue = "1") int currentPage
			, @ModelAttribute("paging") PaginationInfo page
			, Model model	
		){
			PaginationInfo paging = new PaginationInfo(10,5);
			
			paging.setCurrentPage(currentPage);
			paging.setSimpleCondition(page.getSimpleCondition());
			
			List<CommunityVO> departmentNoticeList = service.retrieveDepartmentNoticeList(paging);
			
			PaginationRenderer renderer = new BootstrapFormBasePaginationRenderer("#submitForm");

			String pagingHTML = renderer.renderPagination(paging);
			
			model.addAttribute("departmentNoticeList", departmentNoticeList);
			model.addAttribute("pagingHTML", pagingHTML);
			model.addAttribute("contentTitle", "학과 공지사항");
		return "tiles:manager/com/board/departmentnotice/departmentNoticeList";
	}

	@GetMapping("departmentNoticeDetail/{cmntCode}")
	public String detail(@PathVariable String cmntCode, Model model) {
		CommunityVO notice = service.retrieveDepartmentNotice(cmntCode);
		model.addAttribute("notice", notice);
		return "manager/com/board/departmentnotice/departmentNoticeDetail";
	}
	
	// 인서트 폼
	@GetMapping("departmentNoticeInsertForm")
	public String insertForm(Model model, @RealUser MemberVO mem) {
		String memNo = mem.getMemNo();
		String memName = mem.getMemName();
		List<Map<String, Object>> deptList = dao.selectDeptList();
		model.addAttribute("deptList", deptList);
		model.addAttribute("memNo", memNo);
		model.addAttribute("memName", memName);
	    return "manager/com/board/departmentnotice/departmentNoticeInsertForm";
	}
	
	// 인서트 처리
	@PostMapping("departmentNoticeInsertForm")
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
	        ServiceResult result = service.createDepartmentNotice(notice);
	        String message = null;
	        switch (result) {
	            case OK:
	                logicalViewName = "redirect:/manager/com/board/departmentnotice/departmentNoticeList";
	                break;
	            default:
	                logicalViewName = "manager/com/board/departmentnotice/departmentNoticeInsertForm";
	                message = "다시 입력 바람";
	                break;
	        }
	        model.addAttribute("message", message);
	    } else {
	        logicalViewName = "manager/com/board/departmentnotice/departmentNoticeInsertForm";
	    }
	    return logicalViewName;
	}
	
	
	// 업데이트 폼
	@GetMapping("departmentNoticeEditForm/{cmntCode}")
	public String editForm(@PathVariable String cmntCode, Model model) {
		CommunityVO notice = service.retrieveDepartmentNotice(cmntCode);
		List<Map<String, Object>> deptList = dao.selectDeptList();
		model.addAttribute("deptList", deptList);
		model.addAttribute("notice", notice);
	    return "manager/com/board/departmentnotice/departmentNoticeEditForm";
	}
	
	// 업데이트 처리
	@PostMapping("departmentNoticeEditForm")
	public String update(
	    @Validated(UpdateGroup.class) 
	    @ModelAttribute ("notice") CommunityVO notice,
	    BindingResult errors,
	    Model model
	) {
	    String logicalViewName = null;
	    if (!errors.hasErrors()) {
	        ServiceResult result = service.modifyDepartmentNotice(notice);
	        String message = null;
	        switch (result) {
	            case OK:
	                logicalViewName = "redirect:/manager/com/board/departmentnotice/departmentNoticeList";
	                break;
	            default:
	                logicalViewName = "manager/com/board/departmentnotice/departmenteEditForm";
	                message = "다시 입력 바람";
	                break;
	        }
	        model.addAttribute("message", message);
	    } else {
	        logicalViewName = "manager/com/board/departmentnotice/departmenteEditForm";
	    }
	    return logicalViewName;
	}
	
	@PostMapping("del")
	public String delete(@RequestParam String cmntCode, Model model) {
		service.removeDepartmentNotice(cmntCode);
		return "redirect:/manager/com/board/departmentnotice/departmentNoticeList";
	}
}
