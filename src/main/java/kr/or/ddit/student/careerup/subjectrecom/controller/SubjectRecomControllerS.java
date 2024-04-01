package kr.or.ddit.student.careerup.subjectrecom.controller;

import java.util.List;
import java.util.Map;

import javax.inject.Inject;

import org.springframework.http.MediaType;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.CrossOrigin;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import kr.or.ddit.student.careerup.subjectrecom.service.SubjectRecomService;
import kr.or.ddit.vo.careerup.SeniorCoworkerVO;
import kr.or.ddit.vo.careerup.SubjectRecomVO;
import kr.or.ddit.vo.cyber.SubjectVO;
import lombok.extern.slf4j.Slf4j;

@Slf4j
@Controller
@RequestMapping("/student/careerup/subjectrecom/subjectRecomList")
public class SubjectRecomControllerS {

	@Inject
	SubjectRecomService service;
	
	@GetMapping
	public String go(
			@ModelAttribute("subject") SubjectVO subject,
			@ModelAttribute("senior") SeniorCoworkerVO senior,
			Model model
			) {
	    List<SeniorCoworkerVO> seniorList = service.selectList();
	    model.addAttribute("seniorList", seniorList);
		
	    return "tiles:student/careerup/subjectrecom/subjectRecomList"; 
		
	}
	@PostMapping( produces = MediaType.APPLICATION_JSON_VALUE)
	@ResponseBody
    public SubjectRecomVO recom(
    		@RequestBody SubjectRecomVO condition
//    		@RequestBody String companyType,
//    		@RequestBody String companyJob
    		
    ) {
        return service.select(condition);
    }

}


