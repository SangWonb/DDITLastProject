package kr.or.ddit.professor.cyber.lecturenotice.controller;

import java.util.List;
import java.util.Map;

import javax.inject.Inject;
import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import kr.or.ddit.enumpkg.ServiceResult;
import kr.or.ddit.professor.cyber.lecturenotice.service.LectureNoticeServiceP;
import kr.or.ddit.utils.annotation.RealUser;
import kr.or.ddit.utils.file.service.FTPFileService;
import kr.or.ddit.utils.paging.BootstrapFormBasePaginationRenderer;
import kr.or.ddit.utils.paging.PaginationInfo;
import kr.or.ddit.utils.paging.PaginationRenderer;
import kr.or.ddit.vo.common.CommunityVO;
import kr.or.ddit.vo.cyber.LectureAnnouncementVO;
import kr.or.ddit.vo.user.MemberVO;
import lombok.extern.slf4j.Slf4j;

@Slf4j
@Controller
@RequestMapping("professor/cyber")
public class LectureNoticeRetrieveControllerP {
	
	@Inject
	LectureNoticeServiceP service;
	
	
	
	
	@GetMapping("{lecCode}/lectureNotice")
	public String lectureNoticeList(@PathVariable String lecCode,
			@RequestParam Map<String, Object> detailCondition
			, @RequestParam(name="page", required = false, defaultValue = "1") int currentPage
			, Model model, @ModelAttribute("paging") PaginationInfo page,
			@RealUser MemberVO mem
			) {
		PaginationInfo paging = new PaginationInfo(1,3);
		
		paging.setCurrentPage(currentPage);
		paging.setSimpleCondition(page.getSimpleCondition());
		paging.setDetailCondition(detailCondition);
		
		String memName = mem.getMemName();
		
		List<LectureAnnouncementVO> list = service.retrieveNoticeList(paging,lecCode,memName);
		PaginationRenderer renderer = new BootstrapFormBasePaginationRenderer("#submitForm");
		String pagingHTML = renderer.renderPagination(paging);
		
		int today = service.countBoard();
		int total = paging.getTotalRecord();

		model.addAttribute("lecCode", lecCode);
		model.addAttribute("total", total);
		model.addAttribute("today", today);
		model.addAttribute("list", list);
		log.info("리스트: {}",list);
		model.addAttribute("pagingHTML", pagingHTML);
		model.addAttribute("condition", detailCondition);
		model.addAttribute("contentTitle", "강의공지사항");
			
			
			
		return "tiles:professor/cyber/lecturenotice/lectureNoticeList";
	}
	
	@GetMapping("lecturenotice/lectureNoticeDetail")
	public String details(
			@RequestParam String lecannNo,
			 Model model,
			 HttpSession session
			) {
		LectureAnnouncementVO la = service.retreievela(lecannNo);
		
		model.addAttribute("la", la);
		String lecCode = (String) session.getAttribute("cyberLecCode");
		model.addAttribute("lecCode",lecCode);
		
		return "tiles:professor/cyber/lecturenotice/lectureNoticeDetail";
	}
	
	
	
	
	
	@GetMapping("{lecCode}/lecturenotice/lectureNoticeForm")
	public String lectureNoticeForm(
			
			@PathVariable String lecCode,
			Model model,
			@RealUser MemberVO mem
			) {
		
		model.addAttribute("lecCode",lecCode);
		String memName = mem.getMemName();
		log.info("멤버이름: {}" ,memName);
		model.addAttribute("memName",memName);
		
		return "tiles:professor/cyber/lecturenotice/lectureNoticeForm";
	}
	
	@PostMapping("lecturenotice/lectureNoticeInsert")
	@ResponseBody
	public ServiceResult insert(
			@ModelAttribute LectureAnnouncementVO notice
			,@RealUser MemberVO mem
			) {
		String memName = mem.getMemName();
		notice.setMemName(memName);
		log.info("파일정보{}",notice);
		return service.createNotice(notice);
	}
	@GetMapping("lecturenotice/lectureNoticeEdit")
	public String goUpdateForm(
	    @RequestParam String lecannNo, // 추가
	    Model model
	) {
	    // cmntCode를 이용하여 해당 게시글 정보를 가져옴
	    LectureAnnouncementVO la = service.retreievela(lecannNo);
	    model.addAttribute("la", la);
	    return "tiles:professor/cyber/lecturenotice/lectureNoticeEdit";
	}
	
	
	@PostMapping("lecturenotice/lectureNoticeEdit.do")
	public String update(@ModelAttribute("la") LectureAnnouncementVO la) {
		ServiceResult result = service.modifyNotice(la);
		log.info("ㅎㅇ : {}" , result);
		
		 if (result == ServiceResult.OK) {
		        return "redirect:/professor/cyber/" + la.getLecCode() + "/lectureNotice";
		    } else {
		        return "errorPage";
		    }
		}
	
	@PostMapping("lecturenotice/{lecannNo}")
	public String delete(
			@PathVariable String lecannNo
			,@RequestParam String lecCode
			) {
		service.removeNotice(lecannNo);
		return "redirect:/professor/cyber/"+lecCode+"/lectureNotice";
	}
	

}