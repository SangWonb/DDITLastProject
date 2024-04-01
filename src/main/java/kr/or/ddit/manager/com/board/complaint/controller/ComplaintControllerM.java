package kr.or.ddit.manager.com.board.complaint.controller;

import java.util.List;
import java.util.Map;

import javax.inject.Inject;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import kr.or.ddit.manager.com.board.complaint.service.ComplaintServiceM;
import kr.or.ddit.utils.paging.BootstrapFormBasePaginationRenderer;
import kr.or.ddit.utils.paging.PaginationInfo;
import kr.or.ddit.utils.paging.PaginationRenderer;
import kr.or.ddit.vo.cyber.ComplaintVO;

@Controller
@RequestMapping("/manager/com/board/complaint/")
public class ComplaintControllerM {
	
//	@Inject
//	ComplaintServiceM service;
//	
	@GetMapping("complaintList")
	public String complaintList() {
//		(@RequestParam Map<String, Object> detailCondition
//			, @RequestParam(name="page", required = false, defaultValue = "1") int currentPage
//			, Model model	
//	){
//		model.addAttribute("contentTitle");
//		
//		PaginationInfo paging = new PaginationInfo(5,3);
//		
//		paging.setCurrentPage(currentPage);
//		paging.setDetailCondition(detailCondition);
//		
//		List<ComplaintVO> complaintList = service.retrieveComplainList(paging);
//		
//		PaginationRenderer renderer = new BootstrapFormBasePaginationRenderer("#submitForm");
//
//		String pagingHTML = renderer.renderPagination(paging);
//		
//		model.addAttribute("complaintList", complaintList);
//		model.addAttribute("pagingHTML", pagingHTML);
//		model.addAttribute("condition", detailCondition);
//		model.addAttribute("contentTitle", "민원/오류접수 관리게시판");
		return "manager/com/board/complaint/complaintList";
	}
}
