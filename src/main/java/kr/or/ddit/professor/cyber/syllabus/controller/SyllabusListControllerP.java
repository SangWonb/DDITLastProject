package kr.or.ddit.professor.cyber.syllabus.controller;

import java.util.List;
import java.util.Map;

import javax.inject.Inject;
import javax.validation.groups.Default;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.validation.Errors;
import org.springframework.validation.annotation.Validated;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.PutMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import kr.or.ddit.enumpkg.ServiceResult;
import kr.or.ddit.professor.cyber.syllabus.service.SyllabusServiceP;
import kr.or.ddit.utils.paging.BootstrapFormBasePaginationRenderer;
import kr.or.ddit.utils.paging.PaginationInfo;
import kr.or.ddit.utils.paging.PaginationRenderer;
import kr.or.ddit.validate.InsertGroup;
import kr.or.ddit.validate.UpdateGroup;
import kr.or.ddit.vo.cyber.LecturePlanVO;

@Controller
@RequestMapping("/professor/cyber/syllabus")
public class SyllabusListControllerP {
	
	@Inject
	SyllabusServiceP service;
	
	@GetMapping("syllabusList")
	public String list(			
			@RequestParam Map<String, Object> detailCondition
			, @RequestParam(name="page", required = false, defaultValue = "1") int currentPage
			, Model model	
		){
			PaginationInfo paging = new PaginationInfo(5,3);
			
			paging.setCurrentPage(currentPage);
			paging.setDetailCondition(detailCondition);
			
			List<LecturePlanVO> syllabusList = service.retrieveSyllabusList(paging);
			
			PaginationRenderer renderer = new BootstrapFormBasePaginationRenderer("#submitForm");

			String pagingHTML = renderer.renderPagination(paging);
			
			model.addAttribute("syllabusList", syllabusList);
			model.addAttribute("pagingHTML", pagingHTML);
			model.addAttribute("condition", detailCondition);
			model.addAttribute("contentTitle", "강의계획서");
		
		return "tiles:professor/cyber/syllabus/syllabusList";
	}
	
	@GetMapping("syllabusDetail/{lecCode}")
	public String view(@PathVariable String lecCode, Model model) {
		
		LecturePlanVO lecture = service.retrieveSyllabus(lecCode);
		model.addAttribute("lecture", lecture);
		model.addAttribute("contentTitle", "강의계획서 상세조회");

		return "tiles:professor/cyber/syllabus/syllabusDetail";
	}
	
	/*@PostMapping("syllabusInsertForm")
	public String insert(
		@Validated({ InsertGroup.class, Default.class }) @ModelAttribute("lpCd") LecturePlanVO lpCd,
		Errors errors, RedirectAttributes redirectAttributes, Model model
	) {
		String logicalViewName = null;

		if (!errors.hasErrors()) {
			ServiceResult result = service.createSyllabus(lpCd);
			String message = null;
			switch (result) {
			case OK:
				logicalViewName = "professor/cyber/syllabus/syllabusView/" + lpCd;
				break;
			default:
				logicalViewName = "professor/cyber/syllabus/syllabusInsertForm";
				message = "바꿔야 돼";
				break;
			}
			model.addAttribute("message", message);

		} else {
			logicalViewName = "professor/cyber/syllabus/syllabusInsertForm";
		}
		return logicalViewName;
	}
	
	@GetMapping("syllabusEditForm/{lpCode}")
	public String updateForm(@PathVariable String lpCode, Model model) {
		LecturePlanVO syllabus = service.retrieveSyllabus(lpCode);
		
		model.addAttribute("syllabus", syllabus);
	    return "professor/cyber/syllabus/syllabusEditForm";
	}
	
	@PutMapping("syllabusEditForm/{lpCode}")
	public String update(
	    @PathVariable String lpCode, 
	    @Validated(UpdateGroup.class) @ModelAttribute("lpCode") LecturePlanVO modifyLp, 
	    BindingResult errors,
	    Model model
	) {
	    String logicalViewName = null;
	    if (!errors.hasErrors()) {
	        modifyLp.setLpCode(lpCode);
	        ServiceResult result = service.modifySyllabus(modifyLp);
	        String message = null;
	        switch (result) {
	            case OK:
	                logicalViewName = "professor/cyber/syllabus/syllabusView/" + lpCode; // 강의 코드로 경로 지정
	                break;
	            default:
	                logicalViewName = "professor/cyber/syllabus/syllabusEditForm";
	                message = "다시 입력 바람";
	                break;
	        }
	        model.addAttribute("message", message);
	    } else {
	        logicalViewName = "professor/cyber/syllabus/syllabusEditForm";
	    }
	    return logicalViewName;
	}*/
}