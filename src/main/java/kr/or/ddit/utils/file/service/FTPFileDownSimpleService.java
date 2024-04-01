package kr.or.ddit.utils.file.service;

import org.springframework.http.ResponseEntity;
import org.springframework.web.servlet.mvc.method.annotation.StreamingResponseBody;

/**
 * 더 간편하게 파일 다운로드 하는 로직
 * @author PC-15
 *
 */
public interface FTPFileDownSimpleService {
	
	public String[] gfNoToFileNos (String gfNo);
}
