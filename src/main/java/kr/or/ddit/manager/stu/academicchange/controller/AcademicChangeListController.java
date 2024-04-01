package kr.or.ddit.manager.stu.academicchange.controller;

import java.util.List;
import java.util.Map;

import javax.inject.Inject;
import javax.validation.groups.Default;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.Errors;
import org.springframework.validation.annotation.Validated;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import kr.or.ddit.enumpkg.ServiceResult;
import kr.or.ddit.manager.stu.academicchange.service.AcademicChangeServiceM;
import kr.or.ddit.student.careerup.mentoring.mentoringmentor.dao.RejectSelectBox;
import kr.or.ddit.utils.paging.BootstrapFormBasePaginationRenderer;
import kr.or.ddit.utils.paging.PaginationInfo;
import kr.or.ddit.utils.paging.PaginationRenderer;
import kr.or.ddit.validate.UpdateGroup;
import kr.or.ddit.vo.info.AcademicRecordChangeVO;
import lombok.extern.slf4j.Slf4j;

@Slf4j
@Controller
@RequestMapping("/manager/stu/academicchange")
public class AcademicChangeListController {

	@Inject
	AcademicChangeServiceM service;
	
	@Inject
	RejectSelectBox dao;

	@GetMapping("academicChangeList")
	public String list(@RequestParam Map<String, Object> detailCondition,
			@RequestParam(name = "page", required = false, defaultValue = "1") int currentPage, Model model) {

		PaginationInfo paging = new PaginationInfo(2, 1);

		paging.setCurrentPage(currentPage);
		paging.setDetailCondition(detailCondition);

		List<AcademicRecordChangeVO> record = service.retrieveAcaRecordList();

		PaginationRenderer renderer = new BootstrapFormBasePaginationRenderer("#submitForm");

		String pagingHTML = renderer.renderPagination(paging);

		model.addAttribute("contentTitle", "학적변동신청승인");
		model.addAttribute("pagingHTML", pagingHTML);
		model.addAttribute("condition", detailCondition);
		model.addAttribute("record", record);
		return "tiles:manager/stu/academicchange/academicChangeList";
	}
	
	@GetMapping("academicChangeDetail/{arcNo}")
	public String details(Model model, @PathVariable String arcNo, @ModelAttribute("recode") AcademicRecordChangeVO vo
	) {
	    AcademicRecordChangeVO record = service.retrieveRecord(arcNo);
	    List<Map<String, Object>> rejectList = dao.selectAcademicChangeRejectList();
	    
		model.addAttribute("rejectList", rejectList);
	    model.addAttribute("record", record);

	    return "manager/stu/academicchange/academicChangeDetail";

	}
	
	@PostMapping("academicChangeDetail")
	public String editProcess(
			@Validated({ UpdateGroup.class, Default.class }) @RequestBody AcademicRecordChangeVO vo,
			Errors errors, RedirectAttributes redirectAttributes, Model model) {
		log.info("\n\n\n{}\n\n\n",vo.getMemNo());
		String logicalViewName = null;
		if (!errors.hasErrors()) {
			ServiceResult result = service.modifyRecord(vo);
			String message = null;
			switch (result) {
			case OK:
				logicalViewName = "redirect:/manager/stu/academicchange/academicChangeList";
				break;
			default:
				logicalViewName = "manager/stu/academicchange/academicChangeDetail";
				message = "잘못된 정보 포함";
				break;
			}
			model.addAttribute("message", message);

		} else {
			logicalViewName = "manager/stu/academicchange/academicChangeDetail";
		}
		return logicalViewName;
	}
}
