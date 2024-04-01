package kr.or.ddit.student.info.controller;

import java.util.ArrayList;
import java.util.List;

import javax.inject.Inject;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import com.fasterxml.jackson.databind.ObjectMapper;

import kr.or.ddit.student.info.service.InfoMainService;
import kr.or.ddit.utils.annotation.RealUser;
import kr.or.ddit.vo.common.CalendarVO;
import kr.or.ddit.vo.user.MemberVO;

@Controller
@RequestMapping("student/info/infoMain")
public class InfoMainControllerS {

	@Inject
	private InfoMainService service;
	
    @GetMapping
    public String main(@RealUser MemberVO mem, Model model) {
        String memName = mem.getMemName();
        String memNo = mem.getMemNo();
        String DeptName = mem.getDeptName();
        List<String> Roles = mem.getMemRoles();
        
        List<String> rolesDescriptions = new ArrayList<>();
        for (String role : Roles) {
            switch (role) {
                case "ROLE_S":
                    rolesDescriptions.add("학생");
                    break;
                case "ROLE_P":
                    rolesDescriptions.add("교수");
                    break;
                case "ROLE_M":
                    rolesDescriptions.add("교직원");
                    break;
                case "ROLE_D":
                    rolesDescriptions.add("학과장");
                    break;
                default:
                    // 만약 알 수 없는 역할이 있다면 처리 방법 (예시: 무시하거나, '알 수 없는 역할' 등으로 표시)
                    rolesDescriptions.add("알 수 없는 역할");
                    break;
            }
        }
    	
        
        
        // 모델에 추가
        model.addAttribute("memName", memName);
        model.addAttribute("memNo", memNo);
        model.addAttribute("DeptName", DeptName);
        model.addAttribute("RolesDescriptions", rolesDescriptions);
        
        return "tiles:student/info/infoMain";
    }
    
    @GetMapping("getInfo")
    public String main( Model model) {
    	
    	List<CalendarVO> aList= service.retrieveAList();
    	
    	model.addAttribute("aList", aList);
    	
    	return "jsonView";
    }
}