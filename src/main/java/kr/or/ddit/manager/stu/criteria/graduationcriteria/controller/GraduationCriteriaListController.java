package kr.or.ddit.manager.stu.criteria.graduationcriteria.controller;

import java.util.List;

import javax.inject.Inject;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.validation.annotation.Validated;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import kr.or.ddit.enumpkg.ServiceResult;
import kr.or.ddit.manager.stu.criteria.graduationcriteria.dao.EnglishDAO;
import kr.or.ddit.manager.stu.criteria.graduationcriteria.service.GraduationCriteriaService;
import kr.or.ddit.utils.paging.BootstrapFormBasePaginationRenderer;
import kr.or.ddit.utils.paging.PaginationInfo;
import kr.or.ddit.utils.paging.PaginationRenderer;
import kr.or.ddit.validate.UpdateGroup;
import kr.or.ddit.vo.info.EnglishVO;
import kr.or.ddit.vo.info.GraduationCriteriaVO;
import lombok.extern.slf4j.Slf4j;

@Slf4j
@Controller
@RequestMapping("/manager/stu/criteria/graduationcriteria")
public class GraduationCriteriaListController {
	
	@Inject
	GraduationCriteriaService service;
	
	@Inject
	EnglishDAO dao;

	@GetMapping("graduationCriteriaList")
	public String list(			
			@RequestParam(name="page", required = false, defaultValue = "1") int currentPage
			, @ModelAttribute("paging") PaginationInfo page
			, Model model	
		){
			PaginationInfo paging = new PaginationInfo(5,5);
			
			paging.setCurrentPage(currentPage);
			paging.setSimpleCondition(page.getSimpleCondition());
			
			List<GraduationCriteriaVO> graduationCriteriaList = service.retrieveGraduationCriteriaList(paging);
			
			PaginationRenderer renderer = new BootstrapFormBasePaginationRenderer("#submitForm");

			String pagingHTML = renderer.renderPagination(paging);
			
			model.addAttribute("graduationCriteriaList", graduationCriteriaList);
			model.addAttribute("pagingHTML", pagingHTML);
			model.addAttribute("contentTitle", "졸업요건 기준");
		return "tiles:manager/stu/criteria/graduationcriteria/graduationCriteriaList";
	}
	
	// 업데이트 폼
	@GetMapping("graduationCriteriaEditForm/{grcrCode}")
	public String editForm(@PathVariable String grcrCode, @ModelAttribute("graduationCriteria") GraduationCriteriaVO vo, Model model) {
		GraduationCriteriaVO detail = service.retrieveGraduationCriteria(grcrCode);
		List<EnglishVO> selectBoxEng = dao.selectBoxEng();
		model.addAttribute("detail", detail);
		model.addAttribute("selectBoxEng", selectBoxEng);
	    return "manager/stu/criteria/graduationcriteria/graduationCriteriaEditForm";
	}
	  // 수정 내용 처리
    @PostMapping("graduationCriteriaEditForm")
    public String update(
        @Validated(UpdateGroup.class) 
        @ModelAttribute ("graduationCriteria") GraduationCriteriaVO vo,
        BindingResult errors,
        Model model
    ) {
        String logicalViewName = null;
        if (!errors.hasErrors()) {
            ServiceResult result = service.modifyGraduationCriteria(vo);
            String message = null;
            switch (result) {
                case OK:
                    logicalViewName = "redirect:/manager/stu/criteria/graduationcriteria/graduationCriteriaList";
                    break;
                default:
                    logicalViewName = "manager/stu/criteria/graduationcriteria/graduationCriteriaEditForm";
                    message = "다시 입력 바람";
                    break;
            }
            model.addAttribute("message", message);
        } else {
            logicalViewName = "manager/stu/criteria/graduationcriteria/graduationCriteriaEditForm";
        }
        return logicalViewName;
    }
}
