package kr.or.ddit.student.careerup.employment.coverletterauto.controller;

import java.util.Collections;
import java.util.HashMap;
import java.util.Map;

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
import org.springframework.web.client.HttpStatusCodeException;
import org.springframework.web.client.RestTemplate;

import lombok.extern.slf4j.Slf4j;

@Slf4j
@Controller
@RequestMapping("/student/careerup/employment/coverletterauto/coverLetterAutoView")
public class CoverLetterAutoViewControllerS {
	
	@Value("#{appInfo.apikey}")
	private String apiKey;
    private static final String ENDPOINT = "https://api.openai.com/v1/chat/completions";
	
	@PostMapping
    public ResponseEntity<String> generateCoverLetter(@RequestBody Map<String, String> requestBody) {
        String recomCoverLetter = requestBody.get("recomCoverLetter");
        recomCoverLetter += " 이 3가지 단어로 300자 이내로 자기소개서 내용 추천해줘";
        log.info("\n\n\n\n\n{}\n\n\n\n\n",recomCoverLetter);
        // 요청 본문 설정
        Map<String, Object> requestBodyMap = new HashMap<>();
        requestBodyMap.put("model", "gpt-3.5-turbo");
        Map<String, Object> message = new HashMap<>();
        message.put("role", "user");
        message.put("content", recomCoverLetter); // 사용자 입력 텍스트 추가
        requestBodyMap.put("messages", Collections.singletonList(message));
        requestBodyMap.put("temperature", 0.5);
        requestBodyMap.put("max_tokens", 1024);
        
        // HTTP 요청 보내기
        HttpHeaders headers = new HttpHeaders();
        headers.setBearerAuth(apiKey);
        headers.setContentType(MediaType.APPLICATION_JSON);
        HttpEntity<Map<String, Object>> requestEntity = new HttpEntity<>(requestBodyMap, headers);

        RestTemplate restTemplate = new RestTemplate();
        try {
            ResponseEntity<String> responseEntity = restTemplate.postForEntity(ENDPOINT, requestEntity, String.class);
            return ResponseEntity.ok(responseEntity.getBody());
        } catch (HttpStatusCodeException e) {
            return ResponseEntity.status(e.getRawStatusCode()).body("HTTP 요청이 실패했습니다. 상태 코드: " + e.getRawStatusCode());
        }
    }
    
	@GetMapping
	public String view(Model model){
			model.addAttribute("contentTitle", "AI 자기소개서 추천");
		return "tiles:student/careerup/employment/coverletterauto/coverLetterAutoView";
	}
}
