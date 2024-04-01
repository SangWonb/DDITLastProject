package kr.or.ddit.utils.file.controller;

import java.io.File;
import java.io.IOException;
import java.io.OutputStream;
import java.nio.charset.StandardCharsets;
import java.util.List;

import javax.inject.Inject;

import org.apache.commons.io.FileUtils;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.http.ContentDisposition;
import org.springframework.http.HttpHeaders;
import org.springframework.http.HttpStatus;
import org.springframework.http.MediaType;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RequestPart;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.server.ResponseStatusException;
import org.springframework.web.servlet.mvc.method.annotation.StreamingResponseBody;

import kr.or.ddit.enumpkg.ServiceResult;
import kr.or.ddit.utils.file.CompressUtils;
import kr.or.ddit.utils.file.service.FTPFileDownSimpleService;
import kr.or.ddit.utils.file.service.FTPFileService;
import kr.or.ddit.vo.whole.FileVO;
import lombok.extern.slf4j.Slf4j;

/**
 * 파일처리 컨트롤러 예시
 * 	==목차==
 * 	1. 조회(db조회)
 * 	2. 다운로드(단건/여러건zip)
 * 	3. 업로드
 * 	4. 삭제
 * 
 * #####파일처리시 유의사항#####
 *  1. 해당 테이블을 생성시 FileService >> selectGFNO() 사용해서 gfno 도 같이 설정할것!
 *     + service.makeGFNOFolder(gfNo); 해당하는 폴더도 만들어야함. (DB, 실제파일 만들어짐)
 *  r
 *  2. 해당 테이블 삭제 시 gfNo 폴더를 삭제해야함
 *     + service.deleteFolder(gfNo); 해당하는 폴더, db 삭제됨.	
 * @author PC-15
 *
 */
@Controller
@RequestMapping("/fileftp")
@Slf4j
public class ExampleFTPController {
	
	@Inject
	private FTPFileService service;
	
	@Inject
	private FTPFileDownSimpleService simpleService;
	
	//어쩌피 나중에 db에서 가져올거임
	@Value("#{appInfo.tempFolder}")
	private File tempFolder;
	
	@RequestMapping("makeGF")
	public void MakeNewGF() throws Exception {
		String gfNo="GF000002";
		service.makeGFNOFolder(gfNo);
	}
	
	@RequestMapping("deleteGF")
	public void DeleteGFFolder() throws Exception {
		service.deleteFolder("GF000003");		
	}
	
	@RequestMapping
	public String view(Model model) throws Exception {
		String gfNo="GF000002"; // 지금은 예시를 보여주는거라 그냥 직접 타이핑함.
		List<FileVO> fileList = service.selectFileList(gfNo);
		
		model.addAttribute("fileList", fileList);
		return "file/fileftp";
	}
	
	
	
	/**
	 * 단건 다운로드 예시
	 * @param fileNo
	 * @return
	 * @throws Exception
	 */
	@RequestMapping("single")
	public ResponseEntity<StreamingResponseBody> singleDownloadCase1(@RequestParam("what") String fileNo) throws Exception {
		
		
		/* FTPFileDownSimpleService 를 사용하면 한줄로 처리 가능! 아래의 코드와 똑같음..!
			return simpleService.singleDownload(fileNo);
		*/
		
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
	
	
	/**
	 * 여러건 다운로드 예시 (ZIP)
	 * @param fileNos
	 * @return
	 * @throws Exception
	 */
	@RequestMapping("multiple")
	public ResponseEntity<StreamingResponseBody> multipleDownloadAfterCompress(@RequestBody String[] fileNos) throws Exception {
		
		/* FTPFileDownSimpleService 를 사용하면 한줄로 처리 가능! 아래의 코드와 똑같음..!
			return simpleService.multipleDownload(fileNos);
		*/
		
		if(!service.checkExists(fileNos)) {
			throw new ResponseStatusException(HttpStatus.NOT_FOUND, "파일이 없음.");
		}else {
			File dir = service.receiveFiles(fileNos);
			return CompressUtils.compressAndGenerateResponseEntity(dir);
		}
	}
	
	/**
	 * 한건 삭제
	 * @param fileNo
	 * @throws Exception 
	 */
	@RequestMapping("single/delete")
	public String singleDelete(@RequestParam("what") String fileNo, Model model) throws Exception {
		
		if(!service.checkExist(fileNo)) {
			throw new ResponseStatusException(HttpStatus.NOT_FOUND, "파일이 없음.");
		}else {
			boolean success = service.deleteFile(fileNo) == ServiceResult.OK ? true:false;
			model.addAttribute("success", success);
		}
		
		return "jsonView";
	}
	
	/**
	 * 여러건 삭제
	 * @param fileNos
	 * @return
	 * @throws Exception
	 */
	@RequestMapping("multiple/delete")
	public String multipleDelete(@RequestBody String[] fileNos, Model model) throws Exception {
		
		if(!service.checkExists(fileNos)) {
			throw new ResponseStatusException(HttpStatus.NOT_FOUND, "파일이 없음.");
		}else {
			boolean success = service.deleteFiles(fileNos) == ServiceResult.OK ? true:false;
			model.addAttribute("success", success);
		}
		return "jsonView";
	}
	
	/*
	 * 추가 >> 그룹파일별로 삭제 >> service.service.deleteGoupFile() 사용
	 */
	
	@RequestMapping("multiple/upload")
	public String multipleUpload(@RequestPart(required = true) MultipartFile[] files, Model model) throws Exception {
		
		
		String gfNo="GF000002"; // 지금은 예시를 보여주는거라 그냥 직접 타이핑함.
		String result = service.sendFiles(gfNo, files); // 성공하면 gfNo 반환, 실패하면 에러
		boolean success = result != null ? true:false;
		return "jsonView";
		
	}
	
	/*
	 * 추가 >> 하나의 파일만 업데이트 >> service.sendFile() 사용
	 */
	
	
}
