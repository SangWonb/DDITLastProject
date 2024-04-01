package kr.or.ddit.manager.com.memberregistrate.controller;

import java.io.IOException;
import java.util.Map;

import javax.inject.Inject;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;

import kr.or.ddit.manager.com.memberregistrate.service.MemberRegistrateSerivce;
import kr.or.ddit.vo.user.MemberVO;
import lombok.extern.slf4j.Slf4j;
import retrofit2.http.PartMap;

@Slf4j
@Controller
@RequestMapping("manager/com/memberRegistrateInsert")
public class MemberRegistrateInsertControllerM {
	
	@Inject
	MemberRegistrateSerivce service;
	
	@GetMapping
	public String memberRegistrateInsert(Model model) {
		model.addAttribute("contentTitle", "사용자 일괄 등록");
		return "tiles:manager/com/memberregistrate/memberRegistrateForm";
	}
	
	@PostMapping
	public String excelUpload(@RequestParam("uploadFile") MultipartFile file, Model model) {
		
		boolean success = false;
		
		String originalFilename = file.getOriginalFilename();
		
		try {
			
			MemberVO vo = null;
			
			switch (originalFilename) {
				case "manageruser.xls":
				case "manageruser.xlsx":
					vo = service.createManager(file);
					break;
				case "professoruser.xls":
				case "professoruser.xlsx":
					vo = service.createProfessor(file);
					break;
				case "studentuser.xls":
				case "studentuser.xlsx":
					vo = service.createStudent(file);
					break;
				default:
					model.addAttribute("success", success);
					model.addAttribute("message", "제대로된 파일을 넣어주세요.");
					return "jsonView";
			}
			
			if(vo != null) {
				model.addAttribute("fail", vo);
				model.addAttribute("message", "입력된 내용이 올바르지 않습니다.");
			}else {
				success = true;
			}
			
		} catch (IOException e) {
			model.addAttribute("message", "서버에러");
		}
		
		model.addAttribute("success", success);
		return "jsonView";
	}
	

}
