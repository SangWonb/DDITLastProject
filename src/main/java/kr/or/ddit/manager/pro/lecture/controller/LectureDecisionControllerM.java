package kr.or.ddit.manager.pro.lecture.controller;

import java.util.List;
import java.util.Map;

import javax.inject.Inject;
import javax.validation.groups.Default;

import org.springframework.http.MediaType;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.Errors;
import org.springframework.validation.annotation.Validated;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import kr.or.ddit.enumpkg.ServiceResult;
import kr.or.ddit.manager.pro.lecture.dao.BuildingAndRoomDAO;
import kr.or.ddit.manager.pro.lecture.service.LectureDecisionServiceM;
import kr.or.ddit.student.careerup.mentoring.mentoringmentor.dao.RejectSelectBox;
import kr.or.ddit.utils.annotation.RealUser;
import kr.or.ddit.validate.UpdateGroup;
import kr.or.ddit.vo.cyber.LecOpenListVO;
import kr.or.ddit.vo.user.MemberVO;
import kr.or.ddit.vo.whole.BuildingVO;

@Controller
@RequestMapping("/manager/pro/lecture")
public class LectureDecisionControllerM {

	@Inject
	LectureDecisionServiceM service;
	
	@Inject
	RejectSelectBox dao;
	
	@Inject
	BuildingAndRoomDAO daoBR;

	@GetMapping("lectureList")
	public String applList(@RequestParam Map<String, Object> detailCondition, Model model,
			@RealUser MemberVO mem
	){
			String memNo = mem.getMemNo();
			List<LecOpenListVO> lectureDecisionList = service.retrieveLectureDecisionList();
			model.addAttribute("lectureDecisionList", lectureDecisionList);
			model.addAttribute("memNo", memNo);
			model.addAttribute("condition", detailCondition);
			model.addAttribute("contentTitle", "강의 개설 신청 승인/반려");
		return "tiles:manager/pro/lecture/lectureList";
	}
	
	@GetMapping("lectureDecisionEditForm/{lolAppno}")
	public String editView(@PathVariable String lolAppno, Model model) {
		LecOpenListVO lecture = service.retrieveLectureAppl(lolAppno);
		List<Map<String, Object>> rejectList = dao.selectSubbjectRejectList();
		List<BuildingVO> buildingNoList = daoBR.selectBuildingNoList();
		model.addAttribute("buildingNoList", buildingNoList);
		model.addAttribute("rejectList", rejectList);
		model.addAttribute("lecture", lecture);
		return "manager/pro/lecture/lectureDecisionEditForm";
	}
	
	@PostMapping(value="lectureDecisionEditForm", consumes = MediaType.APPLICATION_JSON_VALUE)
	public String editProcess(
			@Validated({ UpdateGroup.class, Default.class }) @RequestBody LecOpenListVO vo,
			Errors errors, RedirectAttributes redirectAttributes, Model model) {
		
		String logicalViewName = null;
		if (!errors.hasErrors()) {
			ServiceResult result = service.modifyLectureDecision(vo);
			String message = null;
			switch (result) {
			case OK:
				logicalViewName = "redirect:/manager/pro/lecture/lectureList";
				break;
			default:
				logicalViewName = "manager/pro/lecture/lectureDecisionEditForm";
				message = "잘못된 정보 포함";
				break;
			}
			model.addAttribute("message", message);

		} else {
			logicalViewName = "manager/pro/lecture/lectureDecisionEditForm";
		}
		return logicalViewName;
	}
}
