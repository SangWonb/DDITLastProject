package kr.or.ddit.professor.cyber.onlinelecture.controller;

import java.util.Enumeration;
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
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;

import kr.or.ddit.enumpkg.ServiceResult;
import kr.or.ddit.professor.cyber.onlinelecture.service.OnlineLectureServiceP;
import kr.or.ddit.utils.annotation.RealUser;
import kr.or.ddit.utils.paging.BootstrapFormBasePaginationRenderer;
import kr.or.ddit.utils.paging.PaginationInfo;
import kr.or.ddit.utils.paging.PaginationRenderer;
import kr.or.ddit.vo.cyber.LectureAnnouncementVO;
import kr.or.ddit.vo.cyber.LectureOnlineVO;
import kr.or.ddit.vo.cyber.LectureVO;
import kr.or.ddit.vo.user.MemberVO;
import lombok.extern.slf4j.Slf4j;

@Slf4j
@Controller
@RequestMapping("/professor/cyber/onlinelecture")
public class OnlineLectureListControllerP {

	@Inject
	OnlineLectureServiceP service;
	
	
	@GetMapping("onlineLectureList/{lecCode}")
	public String list(
			@PathVariable String lecCode,
		@RequestParam Map<String, Object> detailCondition
		, @RequestParam(name="page", required = false, defaultValue = "1") int currentPage
		, Model model,
		@RealUser MemberVO mem
		) {
	PaginationInfo paging = new PaginationInfo(5,5);
	
	paging.setCurrentPage(currentPage);
	paging.setDetailCondition(detailCondition);
	
	String memName = mem.getMemName();
	
	List<LectureOnlineVO> list = service.retrieveLectureList(paging, memName, lecCode);
	PaginationRenderer renderer = new BootstrapFormBasePaginationRenderer("#submitForm");
	String pagingHTML = renderer.renderPagination(paging);
	
//	int today = service.countBoard();
	int total = paging.getTotalRecord();

	model.addAttribute("lecCode", lecCode);
	model.addAttribute("total", total);
//	model.addAttribute("today", today);
	model.addAttribute("list", list);
	log.info("리스트: {}",list);
	model.addAttribute("pagingHTML", pagingHTML);
	model.addAttribute("condition", detailCondition);
//	model.addAttribute("contentTitle", "온라인강의");
		return "tiles:professor/cyber/onlinelecture/onlineLectureList";
	}
	
	
	@GetMapping("{lecCode}/onlineLectureForm")
	public String onlineLectureForm(
			
			@PathVariable String lecCode,
			Model model,
			@RealUser MemberVO mem
			) {
		
		model.addAttribute("lecCode",lecCode);
		String memName = mem.getMemName();
		log.info("멤버이름: {}" ,memName);
		model.addAttribute("memName",memName);
		
		return "professor/cyber/onlinelecture/onlineLectureForm";
	}
	
	@PostMapping("onLineLectureInsert")
	@ResponseBody
	public ServiceResult insert(
			 @RequestParam("lecFiles") MultipartFile lecFiles,
			@ModelAttribute LectureOnlineVO lec
			,@RealUser MemberVO mem
			) {
		lec.setLecoDateString(lec.getLecoDate().toString());
		String memName = mem.getMemName();
		lec.setMemName(memName);
		
//		attend.setLecCode(lecCode);
//		attend.setAttendDateString(attend.getAtDate().toString());
		log.info("파일정보{}",lec);
		return service.createLecture(lec);
	}
	@GetMapping("onLineLectureDetail")
	public String details(
			@RequestParam String lecoCode,
			 Model model,
			 HttpSession session
			) {
		
		LectureOnlineVO lec = service.retreieveLecture(lecoCode);
		String lecCode = (String) session.getAttribute("cyberLecCode");
		model.addAttribute("lecCode",lecCode);
		model.addAttribute("lec", lec);
		log.info("여기야{}",lec);
		
		return "tiles:professor/cyber/onlinelecture/onlineLectureDetail";
	}
	
	@GetMapping("delete/{lecoCode}")
	public String delete(
			@PathVariable String lecoCode,
			HttpSession session
			) {
		
		String lecCode = (String) session.getAttribute("cyberLecCode");
		
		service.removeLecture(lecoCode);
		log.info("여기당{}",lecCode);
		return "redirect:/professor/cyber/onlinelecture/onlineLectureList/"+lecCode;
				
	}
	
	@GetMapping("onlineLectureEdit")
	public String goUpdateForm(
	    @RequestParam String lecoCode,
	    Model model
	) {
		// 정보가져오기
	    LectureOnlineVO lec = service.retreieveLecture(lecoCode);
	    model.addAttribute("lec", lec);
	    return "tiles:professor/cyber/onlinelecture/onlineLectureEdit";
	}
	@PostMapping("onlineLectureEdit.do")
	public String update(@ModelAttribute("lec") LectureOnlineVO lec,
			@RequestParam("lecFiles") MultipartFile lecFiles
			) {
		ServiceResult result = service.modifyLecture(lec);
		service.modifyLectureFile(lec);
		log.info("ㅎㅇ : {}" , lec);
		
		 if (result == ServiceResult.OK) {
		        return "redirect:/professor/cyber/onlinelecture/onlineLectureList/"+lec.getLecCode();
		    } else {
		        return "errorPage";
		    }
		}	
	
	
	
	
}
