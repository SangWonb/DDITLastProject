package kr.or.ddit.common.board.clubboard.controller;

import java.util.List;
import java.util.Map;

import javax.inject.Inject;

import org.springframework.http.MediaType;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import kr.or.ddit.common.board.clubboard.service.ClubBoardService;
import kr.or.ddit.utils.paging.BootstrapFormBasePaginationRenderer;
import kr.or.ddit.utils.paging.PaginationInfo;
import kr.or.ddit.utils.paging.PaginationRenderer;
import kr.or.ddit.vo.common.ClubRecomVO;
import kr.or.ddit.vo.common.ClubVO;
import kr.or.ddit.vo.common.CommunityVO;
import lombok.extern.slf4j.Slf4j;

@Slf4j
@Controller
@RequestMapping("common/board/clubboard/clubBoardList")
public class RetrieveClubBoardControllerC {
	
	@Inject
	private ClubBoardService service;
	
	
	//동아리목록
	@GetMapping
	public String list(
			@RequestParam Map<String, Object> detailCondition
			, @RequestParam(name="page", required = false, defaultValue = "1") int currentPage
			, Model model	
			) {
		PaginationInfo paging = new PaginationInfo(5,3);
		
		log.info("여기다!!!!!!!!!condition =>>>>>>>>>{}",detailCondition);
		log.info("여기다!!!!!!!!!currentPage =>>>>>>>>>{}",detailCondition);
		log.info("여기다!!!!!!!!!currentPage =>>>>>>>>>{}",paging);

		paging.setCurrentPage(currentPage);
		paging.setDetailCondition(detailCondition);
		
		
		PaginationRenderer renderer = new BootstrapFormBasePaginationRenderer("#submitForm");

		String pagingHTML = renderer.renderPagination(paging);
		
		List<ClubVO> list = service.retrieceClubList(paging);
		
		model.addAttribute("list", list);
		model.addAttribute("pagingHTML", pagingHTML);
		model.addAttribute("condition", detailCondition);
//		model.addAttribute("contentTitle", "동아리목록");
		
		return "tiles:common/board/clubboard/clubBoardList";
	}
	
	//모달 html 반환
	@GetMapping("/recomModal")
	public String restaurantRecomModal() {
		return "tiles:common/board/clubboard/clubRecomForm";
	}
	
	//동아리추천
	@PostMapping
	@ResponseBody
	public List<ClubVO>  selectList(
			@ModelAttribute ClubRecomVO newRecom,
			Model model
			) {
		List<ClubVO> recom=service.retrieveClubRecom(newRecom);
		model.addAttribute("recom",recom);
		log.info("recom:{}",recom);
		
		return recom;
	}

}
