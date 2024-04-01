package kr.or.ddit.student.info.signupclasses.controller;

import java.io.IOException;
import java.time.LocalDate;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.inject.Inject;

import org.springframework.http.MediaType;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import kr.or.ddit.enumpkg.ServiceResult;
import kr.or.ddit.professor.cyber.vo.TimeDataVO;
import kr.or.ddit.student.info.signupclasses.service.SignUpClassesService;
import kr.or.ddit.student.info.signupclasses.vo.SignUpVO;
import kr.or.ddit.utils.annotation.RealUser;
import kr.or.ddit.vo.cyber.DepartmentVO;
import kr.or.ddit.vo.cyber.LecOpenListVO;
import kr.or.ddit.vo.cyber.LectureApplyVO;
import kr.or.ddit.vo.cyber.LectureTimeVO;
import kr.or.ddit.vo.cyber.LectureVO;
import kr.or.ddit.vo.cyber.SubjectVO;
import kr.or.ddit.vo.user.MemberVO;
import kr.or.ddit.vo.user.StudentVO;
import lombok.extern.slf4j.Slf4j;

@Slf4j
@Controller
@RequestMapping("/student/info/signupclasses")
public class SignUpClassesRestControllerS {
	
	@Inject
	SignUpClassesService service;
	
	@GetMapping
	public String signupClassUIPage(Model model,@RealUser StudentVO student) {
		if(!service.singUpSeason()) {
			model.addAttribute("message", "현재는 수강신청 기간이 아닙니다.");
			return "tiles:student/info/infoMain";
		}
		
		model.addAttribute("contentTitle", "수강신청");
		
		StudentVO studentInfo = service.retrieveStudentInfo(student.getSmemNo());
		int year = LocalDate.now().getYear();
		int month = LocalDate.now().getMonthValue();
		String currentSemester = null;
		switch (month) {
		case 3:case 4:case 5:case 6:
			currentSemester = "1";
			break;
		default:
			currentSemester = "2";
			break;
		}
		
		model.addAttribute("studentInfo",studentInfo);
		model.addAttribute("year",year);
		model.addAttribute("currentSemester",currentSemester);
		
			
		
		
		return "tiles:student/info/signupclasses/signUpClassesView";
	}
	
	@PostMapping("signUpListData")
	public String signUpListData(@ModelAttribute SignUpVO signUp, @RealUser StudentVO student, Model model) {
		
		List<LectureVO> classesList = service.retrieveLecListForSignUpClasses(student, signUp);
		List<String> signUpedLecCode = service.signUpedLecCode(student.getSmemNo());
		model.addAttribute("classesList",classesList);
		model.addAttribute("signUpedLecCode",signUpedLecCode);
		
		return "jsonView";
	}
	
	@GetMapping("chooseListData")
	public String chooseListData(Model model, @RealUser StudentVO student) {
		
		List<LectureVO> listChoose = service.retrieveLecListChoose(student.getSmemNo());
		int chooseAllCredit = service.retrieveChooseAllCredit(student.getSmemNo());
		model.addAttribute("listChoose", listChoose);
		model.addAttribute("chooseAllCredit", chooseAllCredit);
		
		//dayIndex
		//startTimeIndex
		//duringTime
		//lolCode
		//lolName
		
		List<String> classList = new ArrayList<String>(); //style
		List<TimeDataVO> timeDataList = new ArrayList<TimeDataVO>(); //rowspan
		
		for(LectureVO lec:listChoose) {
			
			List<LectureTimeVO> lectureTimeList = lec.getLecTimeList();
			classList.add(lec.getLecCode());
			
			for(LectureTimeVO lecT : lectureTimeList) {
				
				Map<String, Integer> timeInfo = service.timeChange(lecT.getLtTime());		
				TimeDataVO timeData = new TimeDataVO(lecT.getLtDay(), lec.getLecCode(), lec.getLolName(), timeInfo.get("start"), timeInfo.get("timeNum"));
				
				timeDataList.add(timeData);
				
				log.info("\n\n\n\n\n\n\n\n=====넣은내용=====\n{}\n\n\n\n\n\n\n\n\n",lecT.getLtTime());
				log.info("\n\n\n\n\n\n\n\n=====나온내용=====\n{}\n\n\n\n\n\n\n\n\n",timeInfo);
				
			}
		}
		
		model.addAttribute("timeDataList", timeDataList);
		model.addAttribute("classList", classList);
		
		
		return "jsonView";
	}
	
	//수강신청
	@GetMapping("signUpLecture")
	public String signUpLecture(@RequestParam String lecCode, @RealUser StudentVO student, Model model) {
		
		ServiceResult result = service.signUpClasses(student.getSmemNo(), lecCode);
		
		switch (result) {
		case OK: model.addAttribute("success", true); break;
		case FAIL: 
			model.addAttribute("success", false);
			model.addAttribute("message", "서버에러");
			break;
		case CRASH:
			model.addAttribute("success", false);
			model.addAttribute("message", "기존 강의와 시간이 충돌합니다.");
			break;
		case FINISH:
			model.addAttribute("success", false);
			model.addAttribute("message", "수강인원이 초과되었습니다.");
			break;
		case OVERFLOW:
			model.addAttribute("success", false);
			model.addAttribute("message", "제한된 학점을 초과하였습니다.");
			break;
		case PKDUPLICATED:
			model.addAttribute("success", false);
			model.addAttribute("message", "중복된 신청입니다.");
			break;
		case NOTEXIST:
			model.addAttribute("success", false);
			model.addAttribute("message", "해당 강의는 존재하지 않습니다.");
			break;
		}
		
		return "jsonView";
	}
	
	//수강신청신청 취소
	@GetMapping("signUpLectureCancle")
	public String signUpLectureCancle(@RequestParam String lecCode, @RealUser StudentVO student, Model model) {
		
		ServiceResult result = service.singnUpClassesCancle(student.getSmemNo(), lecCode);
		switch (result) {
		case OK:
			model.addAttribute("success", true);
			break;

		default:
			model.addAttribute("success", false);
			break;
		}
		
		return "jsonView";
	}
	
	
} 
