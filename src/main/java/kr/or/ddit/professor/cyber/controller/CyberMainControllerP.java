package kr.or.ddit.professor.cyber.controller;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.inject.Inject;
import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import kr.or.ddit.professor.cyber.service.CyberMainService;
import kr.or.ddit.professor.cyber.vo.TimeDataVO;
import kr.or.ddit.utils.annotation.RealUser;
import kr.or.ddit.utils.paging.PaginationInfo;
import kr.or.ddit.utils.paging.PaginationRenderer;
import kr.or.ddit.utils.paging.TamplateFormBasePagingationRenderer;
import kr.or.ddit.vo.cyber.LecOpenListVO;
import kr.or.ddit.vo.cyber.LectureTimeVO;
import kr.or.ddit.vo.cyber.LectureVO;
import kr.or.ddit.vo.user.ProfessorVO;
import lombok.extern.slf4j.Slf4j;


@Slf4j
@Controller
@RequestMapping("professor/cyber/cyberMain")
public class CyberMainControllerP {
	
	@Inject
	CyberMainService service;
	
	@GetMapping
	public String cyber(Model model, @RealUser ProfessorVO professor) {
		
		model.addAttribute("contentTitle", "강의메인페이지");
		model.addAttribute("professor", professor);
		
		return "tiles:professor/cyber/cyberMain";
	}
	
	/**
	 * 세션에 현재 선택된 lecCode를 저장
	 * @param session
	 * @param lecCode
	 */
	@GetMapping("sessionLecCode/{lecCode}")
	public void cyberMain(HttpSession session, @PathVariable String lecCode) {
		log.info("\n\n\n\n\n\n==== cyberLecCode =====\n{}\n\n\n\n\n\n",lecCode);
		session.setAttribute("cyberLecCode", lecCode);
	}
	
	@GetMapping("timeData")
	public String cyberTimeData(Model model) {
		
		//dayIndex
		//startTimeIndex
		//duringTime
		//lolCode
		//lolName
		
		List<String> classList = new ArrayList<String>(); //style
		List<TimeDataVO> timeDataList = new ArrayList<TimeDataVO>(); //rowspan
		List<LecOpenListVO> lolList = service.retrieveLOLList();
		
		for(LecOpenListVO lol:lolList) {
			
			List<LectureTimeVO> lectureTimeList = lol.getLectureTimeList();
			classList.add(lol.getLolCode());
			
			for(LectureTimeVO lecT : lectureTimeList) {
				
				Map<String, Integer> timeInfo = service.timeChange(lecT.getLtTime());		
				TimeDataVO timeData = new TimeDataVO(lecT.getLtDay(), lol.getLolCode(), lol.getLolName(), timeInfo.get("start"), timeInfo.get("timeNum"));
				
				timeDataList.add(timeData);
				
				log.info("\n\n\n\n\n\n\n\n=====넣은내용=====\n{}\n\n\n\n\n\n\n\n\n",lecT.getLtTime());
				log.info("\n\n\n\n\n\n\n\n=====나온내용=====\n{}\n\n\n\n\n\n\n\n\n",timeInfo);
				
				
			}
		}
		
		model.addAttribute("timeDataList", timeDataList);
		model.addAttribute("classList", classList);
		
		return "jsonView";
	}
	
	@GetMapping("lecList")
	public String cyberLecListData(
			@RequestParam(name="page", required = false, defaultValue = "1") int currentPage
			,Model model, @RealUser ProfessorVO pro) {
		
		PaginationInfo paging = new PaginationInfo(6,3);
		paging.setCurrentPage(currentPage);
		String pmemNo = pro.getPmemNo();
		
		List<LectureVO> lecList = service.retrieveLectureListP(pmemNo, paging);
		
		PaginationRenderer renderer = new TamplateFormBasePagingationRenderer("#searchForm");
		String pagingHTML = renderer.renderPagination(paging);
		
		model.addAttribute("lecList", lecList);
		model.addAttribute("pagingHTML", pagingHTML);
		
		return "jsonView";
	}
	
	
	
	
	
	
	
}
