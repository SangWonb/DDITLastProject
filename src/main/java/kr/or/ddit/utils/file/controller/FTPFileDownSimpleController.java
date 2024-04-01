package kr.or.ddit.utils.file.controller;

import java.io.File;
import java.io.FileInputStream;
import java.io.IOException;
import java.io.InputStream;
import java.io.OutputStream;
import java.io.RandomAccessFile;
import java.nio.charset.StandardCharsets;

import javax.inject.Inject;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.commons.io.FileUtils;
import org.apache.commons.io.IOUtils;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.core.io.FileSystemResource;
import org.springframework.core.io.Resource;
import org.springframework.http.ContentDisposition;
import org.springframework.http.HttpHeaders;
import org.springframework.http.HttpStatus;
import org.springframework.http.MediaType;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.server.ResponseStatusException;
import org.springframework.web.servlet.mvc.method.annotation.StreamingResponseBody;

import kr.or.ddit.utils.file.CompressUtils;
import kr.or.ddit.utils.file.service.FTPFileDownSimpleService;
import kr.or.ddit.utils.file.service.FTPFileService;
import kr.or.ddit.vo.whole.FileVO;
import lombok.extern.slf4j.Slf4j;

@Controller
@Slf4j
@RequestMapping("/download")
public class FTPFileDownSimpleController {
	
	@Inject
	private FTPFileDownSimpleService simpleService;
	
	@Inject
	private FTPFileService service;
	
	@Value("#{appInfo.tempFolder}")
	private File tempFolder;
	
	
	/**
	 * 단건 다운로드
	 * @param fileNo
	 * @return
	 * @throws Exception
	 */
	@RequestMapping("single")
	public ResponseEntity<StreamingResponseBody> singleDownloadCase(@RequestParam("fileNo") String fileNo) throws Exception {
		if(!service.checkExist(fileNo)) {
			throw new ResponseStatusException(HttpStatus.NOT_FOUND, "파일이 없음.");
		}else {
			File dir = service.receiveFile(fileNo);
			
			HttpHeaders headers = new HttpHeaders();
			headers.setContentType(MediaType.APPLICATION_OCTET_STREAM);
			headers.setContentLength(dir.length());
			headers.setContentDisposition(
					ContentDisposition.attachment() // 다운로드 이름
									.filename(dir.getName(), StandardCharsets.UTF_8)
									.build());
			
			return ResponseEntity.ok()
					.headers(headers)
					.body(new StreamingResponseBody() {
							@Override
							public void writeTo(OutputStream os) throws IOException {
								try {
									FileUtils.copyFile(dir, os);
									os.flush();
								}finally {
									os.close();
								}
							}
					});
		}
	}
	
	@RequestMapping("video/{fileNo}")
	public ResponseEntity<StreamingResponseBody> video(
	        @PathVariable("fileNo") String fileNo,
	        HttpServletRequest request,
	        HttpServletResponse response) throws Exception {

	    if (!service.checkExist(fileNo)) {
	        throw new ResponseStatusException(HttpStatus.NOT_FOUND, "파일이 없음.");
	    } else {
	    	File videoFile = service.receiveFile(fileNo);
	        log.info("videoFile : {}", videoFile);
	        
	        if (!videoFile.isFile()) {
	            return ResponseEntity.notFound().build();
	        }

	        final InputStream inputStream = new FileInputStream(videoFile);
	        StreamingResponseBody streamingResponseBody = new StreamingResponseBody() {
	            @Override
	            public void writeTo(OutputStream outputStream) throws IOException {
	            	IOUtils.copy(inputStream, outputStream);
	
	            }
	        };

	        HttpHeaders headers = new HttpHeaders();
			headers.setContentType(MediaType.APPLICATION_OCTET_STREAM);
			headers.setContentLength(videoFile.length());
			
//	        final HttpHeaders responseHeaders = new HttpHeaders();
//	        responseHeaders.add("Content-Type", "video/avi");
//	        responseHeaders.add("Content-Length", Long.toString(videoFile.length()));

	        return ResponseEntity.ok().headers(headers).body(streamingResponseBody);
	    }

	  
	}

	
	/**
	 * 여러건 다운로드 (ZIP) // json으로 요청 받음.
	 * @param fileNos
	 * @return
	 * @throws Exception
	 */
	@RequestMapping("multipleFiles")
	public ResponseEntity<StreamingResponseBody> multipleDownloadAfterCompress(@RequestBody String[] fileNos) throws Exception {
		if(!service.checkExists(fileNos)) {
			throw new ResponseStatusException(HttpStatus.NOT_FOUND, "파일이 없음.");
		}else {
			File dir = service.receiveFiles(fileNos);
			return CompressUtils.compressAndGenerateResponseEntity(dir);
		}
		
	}

	/**
	 * 여러건 다운로드 (ZIP) 
	 * @param fileNos
	 * @return
	 * @throws Exception
	 */
	@RequestMapping("multipleGfNo")
	public ResponseEntity<StreamingResponseBody> multipleDownloadAfterCompressGfNo(@RequestParam("gfNo") String gfNo) throws Exception {
		
		String[] fileNos = simpleService.gfNoToFileNos(gfNo);
		
		if(!service.checkExists(fileNos)) {
			throw new ResponseStatusException(HttpStatus.NOT_FOUND, "파일이 없음.");
		}else {
			File dir = service.receiveFiles(fileNos);
			return CompressUtils.compressAndGenerateResponseEntity(dir);
		}
		
	}
	
	
	
}
