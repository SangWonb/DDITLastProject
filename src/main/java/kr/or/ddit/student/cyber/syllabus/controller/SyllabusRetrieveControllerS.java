package kr.or.ddit.student.cyber.syllabus.controller;

import javax.inject.Inject;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;

import kr.or.ddit.professor.cyber.syllabus.service.SyllabusServiceP;
import kr.or.ddit.vo.cyber.LecturePlanVO;

@Controller
@RequestMapping("/student/cyber/syllabus")
public class SyllabusRetrieveControllerS {
	
	@Inject
	SyllabusServiceP service;
	
	/*@GetMapping
	public String retrieve(
			@RequestParam Map<String, Object> detailCondition
			, @RequestParam(name="page", required = false, defaultValue = "1") int currentPage
			, Model model	
		){
		PaginationInfo paging = new PaginationInfo(3,3);
		
		paging.setCurrentPage(currentPage);
		paging.setDetailCondition(detailCondition);
		
//		List<LecturePlanVO> lecturePlanList = "";
		
		PaginationRenderer renderer = new BootstrapFormBasePaginationRenderer("#submitForm");

		String pagingHTML = renderer.renderPagination(paging);
		
		model.addAttribute("pagingHTML", pagingHTML);
		model.addAttribute("contentTitle", "강의계획서");
		return "student/cyber/syllabus/syllabusList";
	}*/
	
	@GetMapping("syllabusDetail/{lecCode}")
	public String view(@PathVariable String lecCode, Model model) {
		
		LecturePlanVO lecture = service.retrieveSyllabus(lecCode);

		model.addAttribute("lecture", lecture);
		model.addAttribute("contentTitle", "강의계획서 상세조회");

		return "tiles:student/cyber/syllabus/syllabusDetail";
	}
}
