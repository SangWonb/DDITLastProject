package kr.or.ddit.common.mail.controller;

import java.util.Map;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import kr.or.ddit.utils.paging.BootstrapFormBasePaginationRenderer;
import kr.or.ddit.utils.paging.PaginationInfo;
import kr.or.ddit.utils.paging.PaginationRenderer;

@Controller
@RequestMapping("/common/mail/mailList")
public class MailListControllerC {

	
	@GetMapping
	public String list(			
			@RequestParam Map<String, Object> detailCondition
			, @RequestParam(name="page", required = false, defaultValue = "1") int currentPage
			, Model model	
		){
			PaginationInfo paging = new PaginationInfo(1,3);
			
			paging.setCurrentPage(currentPage);
			paging.setDetailCondition(detailCondition);
			
//			List<ScholashipVO> scholashipList = service.retrieveScholashipList(paging);
			
			PaginationRenderer renderer = new BootstrapFormBasePaginationRenderer("#submitForm");

			String pagingHTML = renderer.renderPagination(paging);
			
//			model.addAttribute("scholashipList", scholashipList);
			model.addAttribute("pagingHTML", pagingHTML);
			model.addAttribute("condition", detailCondition);
			model.addAttribute("contentTitle", "메일");
		return "tiles:common/mail/mailList";
	}
}
