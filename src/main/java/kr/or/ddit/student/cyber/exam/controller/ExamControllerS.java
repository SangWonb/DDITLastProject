package kr.or.ddit.student.cyber.exam.controller;


import java.util.List;

import javax.inject.Inject;
import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;

import kr.or.ddit.enumpkg.ServiceResult;
import kr.or.ddit.student.cyber.exam.service.ExamService;
import kr.or.ddit.utils.annotation.RealUser;
import kr.or.ddit.vo.cyber.LecTestVO;
import kr.or.ddit.vo.cyber.RegistrationVO;
import kr.or.ddit.vo.cyber.TestGradeVO;
import kr.or.ddit.vo.cyber.TestQuestionVO;
import kr.or.ddit.vo.user.MemberVO;
import lombok.extern.slf4j.Slf4j;

@Slf4j
@Controller
@RequestMapping("/student/cyber/exam/")
public class ExamControllerS {

	@Inject
	private ExamService service;
	
	@GetMapping("exam")
	public String ExamList(
		@RealUser MemberVO mem,
		Model model,
		HttpSession session
	) {
		String memNo = mem.getMemNo();
		String memName = mem.getMemName();
		
		model.addAttribute("memNo", memNo);
		model.addAttribute("memName", memName);
		
		String lecCode = (String) session.getAttribute("cyberLecCode");
		log.info("lecCode:{}",lecCode);
		List<LecTestVO> testList= service.retrieveExam(lecCode);
		
		model.addAttribute("testList", testList);
		model.addAttribute("contentTitle", "온라인시험");
		
		return "tiles:student/cyber/exam/exam";
	}
	
	@PostMapping("saveLTcode")
	public String saveLT(
			HttpSession session,
			@RequestBody String ltCode,
			Model model
			) {
		log.info("ltCode:{}",ltCode);
		ServiceResult result = null;
		
		if(ltCode!=null) {
			session.setAttribute("ltCode", ltCode);
			result = ServiceResult.OK;
		}else {
			result = ServiceResult.FAIL;
		}
	
		model.addAttribute("result",result);
		
		return "jsonView";
	}
	
	@GetMapping("takeAnExam")
	public String Exam(
			@RealUser MemberVO mem,
			Model model,
			HttpSession session
			){
		String memNo = mem.getMemNo();
		String memName = mem.getMemName();
		
		String ltCode ="LT20240002";
//		String ltCode = (String) session.getAttribute("ltCode");
		log.info("ltCode",ltCode);
		
		List<TestQuestionVO> qList=service.retrieveQ(ltCode);
		LecTestVO testInfo=service.retrieveExamDetail(ltCode);
		
		model.addAttribute("memNo", memNo);
		model.addAttribute("memName", memName);
		model.addAttribute("qList", qList);
		model.addAttribute("testInfo", testInfo);
		
		String total = testInfo.getLtTotalScore();
		session.setAttribute("total", total);
		
		return "tiles:student/cyber/exam/takeAnExam";
	}
	
	@GetMapping("getAnswer")
	public String answerList(
			Model model
//			@RequestParam String ltCode
			) {
		
		String ltCode="LT20240002";
		List<String> answerList = service.retrieveA(ltCode);
		List<String> score = service.retrieveS(ltCode);
		
		model.addAttribute("answerList", answerList);
		model.addAttribute("score", score);
		
		return "jsonView";
	}
	
	@PostMapping("insertScore")
	public String insertScore(
			@RealUser MemberVO mem,
			Model model,
			HttpSession session,
			@RequestBody String totalScore
			) {
		String lecCode = (String) session.getAttribute("cyberLecCode");
		String memNo = mem.getMemNo();
		
		RegistrationVO rInfo = new RegistrationVO();
		rInfo.setLecCode(lecCode);
		rInfo.setSmemNo(memNo);
		
		String ltCode = (String) session.getAttribute("ltCode");
		String lhCode = service.retrieveLHcode(rInfo);
		
//		log.info("ltCode===>",ltCode);
//		log.info("lhCode><><><><",lhCode);
		
		TestGradeVO newInfo = new TestGradeVO();
		newInfo.setLhCode(lhCode);
		newInfo.setSmemNo(memNo);
		newInfo.setLtCode(ltCode);
		
		String t = (String) session.getAttribute("total");
		int total =  Integer.parseInt(t);
		
		int score = Integer.parseInt(totalScore);
		double percentage = ((double) score / total) * 100;
		int roundedPercentage = (int) Math.round(percentage);
		String tScore = String.valueOf(roundedPercentage);
		
		newInfo.setTgRecord(tScore);
		
//		log.info("newInfo",newInfo);

		ServiceResult result = service.addNewGrade(newInfo);
		
		model.addAttribute("result", result);
		model.addAttribute("ltCode", ltCode);
		
		return "jsonView";
	}
	

}





