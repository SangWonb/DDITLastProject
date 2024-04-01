package kr.or.ddit.student.cyber.lecturematerial.controller;

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

import kr.or.ddit.professor.cyber.lecturematerial.service.LectureDataServiceP;
import kr.or.ddit.utils.paging.BootstrapFormBasePaginationRenderer;
import kr.or.ddit.utils.paging.PaginationInfo;
import kr.or.ddit.utils.paging.PaginationRenderer;
import kr.or.ddit.vo.cyber.LectureDataVO;
import lombok.extern.slf4j.Slf4j;

@Slf4j
@Controller
@RequestMapping("/student/cyber")
public class LectureDataControllerS {
	
	@Inject
	LectureDataServiceP service;
	
	@GetMapping("{lecCode}/lectureDataList")
	public String list(@PathVariable String lecCode,
			@RequestParam Map<String, Object> detailCondition,
			@RequestParam(name="page", required = false, defaultValue = "1") int currentPage
			, @ModelAttribute("paging") PaginationInfo page
			, Model model
			) {
		PaginationInfo paging = new PaginationInfo(5,5);
		
		paging.setCurrentPage(currentPage);
		paging.setSimpleCondition(page.getSimpleCondition());
		paging.setDetailCondition(detailCondition);

		List<LectureDataVO> lectureDataList = service.retrieveLectureDataList(paging, lecCode);

		PaginationRenderer renderer = new BootstrapFormBasePaginationRenderer("#submitForm");
		String pagingHTML = renderer.renderPagination(paging);
		
		
		model.addAttribute("lectureDataList", lectureDataList);
		model.addAttribute("pagingHTML", pagingHTML);
		model.addAttribute("contentTitle", "강의자료실");
			
		return "tiles:student/cyber/lecturedata/lectureDataList";
	}
	
	@GetMapping("lectureDataDetail")
	public String detail(@RequestParam String lecDatano, Model model) {
		LectureDataVO data = service.retrieveLectureData(lecDatano);
		model.addAttribute("data", data);
		return "tiles:student/cyber/lecturedata/lectureDataDetail";
	}
}
