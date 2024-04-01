package kr.or.ddit.utils.file.service;

import java.io.File;
import java.io.IOException;
import java.io.OutputStream;
import java.nio.charset.StandardCharsets;
import java.util.List;

import javax.inject.Inject;

import org.apache.commons.io.FileUtils;
import org.springframework.http.ContentDisposition;
import org.springframework.http.HttpHeaders;
import org.springframework.http.HttpStatus;
import org.springframework.http.MediaType;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.web.server.ResponseStatusException;
import org.springframework.web.servlet.mvc.method.annotation.StreamingResponseBody;

import kr.or.ddit.utils.file.CompressUtils;
import kr.or.ddit.utils.file.dao.FileDAO;
import kr.or.ddit.vo.whole.FileVO;

@Service
public class FTPFileDownSimpleServiceImpl implements FTPFileDownSimpleService {
	
	@Inject
	private FileDAO dao;
	
	public String[] gfNoToFileNos (String gfNo) {
		
		List<FileVO> files = dao.selectFiles(gfNo);
		String[] fileNos = new String[files.size()];
		
		for(int i=0; i<files.size(); i++) {
			fileNos[i] = files.get(i).getFileNo();
		}
		
		return fileNos;
	}

}
