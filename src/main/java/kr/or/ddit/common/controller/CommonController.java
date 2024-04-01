package kr.or.ddit.common.controller;

import java.util.Collections;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.inject.Inject;
import javax.json.Json;

import org.springframework.beans.factory.annotation.Value;
import org.springframework.http.HttpEntity;
import org.springframework.http.HttpHeaders;
import org.springframework.http.MediaType;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.client.HttpStatusCodeException;
import org.springframework.web.client.RestTemplate;
import org.springframework.web.servlet.ModelAndView;

import kr.or.ddit.common.board.academicnotice.service.AcademicNoticeService;
import kr.or.ddit.common.book.popularbook.service.PopularBookService;
import kr.or.ddit.common.book.service.BookService;
import kr.or.ddit.common.service.PortletServiceC;
import kr.or.ddit.student.careerup.employment.employmentagency.service.EmploymentAgencyServiceS;
import kr.or.ddit.student.careerup.employment.employmenteducation.service.EmployProgramServiceS;
import kr.or.ddit.student.info.scholarship.service.ScholarshipService;
import kr.or.ddit.utils.annotation.RealUser;
import kr.or.ddit.utils.paging.PaginationInfo;
import kr.or.ddit.vo.careerup.EmployProgramVO;
import kr.or.ddit.vo.careerup.EmploymentPlaceVO;
import kr.or.ddit.vo.common.BookRecomVO;
import kr.or.ddit.vo.common.BookRentalVO;
import kr.or.ddit.vo.common.CommunityVO;
import kr.or.ddit.vo.common.PortletVO;
import kr.or.ddit.vo.info.ScholashipRecVO;
import kr.or.ddit.vo.user.MemberVO;
import lombok.extern.slf4j.Slf4j;

@Slf4j
@Controller
@RequestMapping("/common")
public class CommonController {
	
	 private final Map<String, String> customAnswers = new HashMap<>();
		
	
	
	 public CommonController() {
		 customAnswers.put("수강" , "한국인재대학교의 2024 수강신청은 4월1일입니다.\r\n"
		 		+ "통합정보시스템의 수강신청 메뉴에서 이용하실 수 있습니다.\r\n"
		 		+ "\r\n"
		 		+ "다음은 각학년별 수강신청 시간 안내입니다.\r\n"
		 		+ "1학년 16:00~18:00\r\n"
		 		+ "2학년 14:00~16:00\r\n"
		 		+ "3학년 12:00~14:00\r\n"
		 		+ "4학년 9:00~11:00\r\n"
		 		+ "\r\n"
		 		+ "시간의 유의해 신청해주시길 바랍니다.");
		 customAnswers.put("시설" , "한국 인재 대학교의 시설 예약은 통합 정보 시스템에서 조회/예약/예약 취소 할 수 있습니다.^^  "); 
		 customAnswers.put("민원", "한국 인재 대학교 내의 민원/오류 접수는 인재 게시판에서 할 수 있습니다. 단 게시판 취지에 맞지 않거나 부적절한 게시글은 임의로 삭제 될 수 있음을 알려드립니다.");
		 customAnswers.put("정정", "수정신청 정정기간은 4월 3일부터~5일까지 이루어지며 전학년이 이용하실 수 있습니다. ");
		 
	    }
	 
	 public String getCustomAnswer(String userQuestion) {
		 for (String keyword : customAnswers.keySet()) {
		        if (userQuestion.contains(keyword)) {
		            return customAnswers.get(keyword); 
		        }
	 }	
		 return null;
	 }
	@Value("#{appInfo.apikey}")
	private String apiKey;
	private static final String ENDPOINT = "https://api.openai.com/v1/chat/completions";

	@Inject
	private BookService service;
	@Inject
	private PopularBookService services;
	@Inject
	private PortletServiceC portService;
	@Inject
	AcademicNoticeService serviceAca;
	@Inject
	ScholarshipService serviceSch;
	@Inject
	EmploymentAgencyServiceS serviceEmp;
	@Inject
	EmployProgramServiceS servicePro;

	@GetMapping("mainPage")
	public String mainView(
			Model model,
			@RealUser MemberVO mem,
			@RequestParam(name="page", required = false, defaultValue = "1") int currentPage
			) {
		MemberVO member = portService.retreiveMember(mem.getMemNo());
		model.addAttribute("member",member);
		
		// 학사 공지사항 데이터
		PaginationInfo paging = new PaginationInfo(3,3);
		paging.setCurrentPage(currentPage);
		List<CommunityVO> academicNoticeList = serviceAca.retrieveAcademicNoticeList(paging);
		List<ScholashipRecVO> retrieveScholashipRecList = serviceSch.retrieveScholashipRecList(mem.getMemNo());
		List<EmployProgramVO> retrieveEmployProgramList = servicePro.retrieveEmployProgramListForPo();
		List<BookRentalVO> popBook = services.retrievePopBook();
    	

    	model.addAttribute("popBook",popBook);
		model.addAttribute("schList", retrieveScholashipRecList);
		model.addAttribute("proList", retrieveEmployProgramList);
		model.addAttribute("academicNoticeList", academicNoticeList);
		
		model.addAttribute("userSirel", mem.getMemNo());
		
		return "tiles:common/mainPage";
	}
	
	@ResponseBody
	@PostMapping(value= "mainPortletAjax")
	public Map<String, Object> mainPortletAjax(@RequestParam(value = "userSirel") String userSirel, Model model) {
		
		List<PortletVO> portletList = portService.selectPortletList(userSirel);
		Map<String, Object> map = new HashMap<String, Object>();
		
		List<ScholashipRecVO> retrieveScholashipRecList = serviceSch.retrieveScholashipRecList(userSirel);
		List<EmploymentPlaceVO> retrieveEmploymentAgencyList = serviceEmp.retrieveEmploymentAgencyListForPo();
		List<BookRentalVO> popBook = services.retrievePopBook();
    	
    	model.addAttribute("popBook",popBook);
		model.addAttribute("schList", retrieveScholashipRecList);
		model.addAttribute("empList", retrieveEmploymentAgencyList);
		
		map.put("portletList", portletList);
		log.info("여기{}", portletList);
		
		
		return map;
	}
	
//	@GetMapping("movePortlet")
//	public String movePotlet(
//			Model model,
//			@RealUser MemberVO mem
//			) {
//		List<PortletVO> portlet =	portService.selectPortletList(mem.getMemNo());
//		model.addAttribute("portlet",portlet);
//		log.info("포틀릿:{}",portlet);
//		return "tiles:common/portlet/movePortlet";
//	}

	@PostMapping(value = "bookAiList")
	public String BookRecom(@RequestParam String bookCategory, @RealUser MemberVO mem, Model model) {

		BookRecomVO bookRecom = new BookRecomVO();
		bookRecom.setBookCategory(bookCategory);
		bookRecom.setDeptCode(mem.getMemNo());

		BookRecomVO bookAiList = service.selectBookRecom(bookRecom);

		log.info("model : {}", model);
		model.addAttribute(bookAiList);

		return "jsonView";
	}
	
	@PostMapping(value = "chatbot/answer", produces = MediaType.APPLICATION_JSON_VALUE)
	@ResponseBody
	public Map<String, Object> generateAnswer(@RequestBody Map<String, String> requestBody) {
	    // 사용자 입력 받기
	    String userQuestion = requestBody.get("recomCoverLetter");
	    String customAnswer = getCustomAnswer(userQuestion); // 커스텀 답변을 가져옵니다.
	    
	    
	    
	    log.info("여기다 {} ", userQuestion);

	    Map<String, Object> requestBodyMap = new HashMap<>();
	    requestBodyMap.put("model", "gpt-3.5-turbo");
	    Map<String, Object> message = new HashMap<>();
	    message.put("role", "user");
	    message.put("content", userQuestion); // 사용자 입력 텍스트 추가
	    requestBodyMap.put("messages", Collections.singletonList(message));
	    requestBodyMap.put("temperature", 0.5);
	    requestBodyMap.put("max_tokens", 500);

	    // HTTP 요청 보내기
	    HttpHeaders headers = new HttpHeaders();
	    headers.setBearerAuth(apiKey); // API 키 설정
	    headers.setContentType(MediaType.APPLICATION_JSON);
	    HttpEntity<Map<String, Object>> requestEntity = new HttpEntity<>(requestBodyMap, headers);

	    // RestTemplate을 사용하여 요청 보내기
	    RestTemplate restTemplate = new RestTemplate();
	    try {
	        ResponseEntity<String> responseEntity = restTemplate.postForEntity(ENDPOINT, requestEntity, String.class);
	        // 응답을 Map으로 변환하여 반환
	        Map<String, Object> responseMap = new HashMap<>();
	        responseMap.put("response", responseEntity.getBody());
	        responseMap.put("customResponse", customAnswer);
	        log.info("리스폰스 :  {}" ,responseMap);
//	        log.info("커스텀리스폰스 :  {}" ,responseMap);
	        
	        return responseMap;
	    } catch (HttpStatusCodeException e) {
	        // 오류 응답을 Map으로 변환하여 반환
	        Map<String, Object> errorMap = new HashMap<>();
	        errorMap.put("error", "HTTP 요청이 실패했습니다. 상태 코드: " + e.getRawStatusCode());
	        return errorMap;
	    }
	}
	 
	 @GetMapping("chatbot/openChat")
	   public String view(Model model){
	      return "common/chatbot/openChat";
	   }



}