package kr.or.ddit.member.login.controller;

import javax.inject.Inject;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import kr.or.ddit.member.login.dao.NewStudentIDDAO;
import kr.or.ddit.vo.user.MemberVO;
import kr.or.ddit.vo.user.StudentVO;
import lombok.extern.slf4j.Slf4j;

@Controller
@RequestMapping("newStudentID")
@Slf4j
public class NewStudentIDController {
	
	@Inject
	NewStudentIDDAO dao;
	
	@GetMapping
	public String newStudentID() {
		
		return "tiles:login/newStudentID";
	}
	
	@PostMapping
	public String newStudentIDData(@ModelAttribute StudentVO student, Model model) {
		
		log.info("\n\n\n\n\n\n\n====== 신입생 학번 조회 ======\n{}\n\n\n\n\n\n\n",student);
		if(student.getMemReg1() == null || student.getStuEnrollno() == null) {
			model.addAttribute("success", false);
			model.addAttribute("message","내용을 입력해주세요.");
		}
			
		StudentVO stu = dao.select(student);
		if(stu == null) {
			model.addAttribute("success", false);
			model.addAttribute("message","해당하는 학번이 존재하지 않습니다.");
		}else {
			model.addAttribute("success", true);
			model.addAttribute("stu", stu);
		}
		
		
		return "jsonView";
	}
	
}
