package kr.or.ddit.utils.file.controller;

import java.io.File;
import java.io.FileInputStream;
import java.io.IOException;
import java.nio.file.Files;
import java.util.Base64;
import java.util.List;

import javax.inject.Inject;

import org.springframework.http.HttpStatus;
import org.springframework.http.MediaType;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import kr.or.ddit.utils.file.service.FTPFileService;
import kr.or.ddit.vo.whole.FileVO;

@Controller
@RequestMapping("/imgShow")
public class ImageShowController {

	@Inject
	FTPFileService fService;
	
	@GetMapping()
	public String getUI () {
		return "file/show";
	}

	@GetMapping("getImage")
    public ResponseEntity<String> getImage(@RequestParam("fileNo") String FileNo) {
        try {
            File imageFile = fService.receiveFile(FileNo); // fileNo를 클라이언트로부터 받아와야 함
            
            // 이미지 파일을 Base64로 변환
            String base64Image = convertToBase64(imageFile);
            
            // Base64로 변환된 이미지 데이터를 클라이언트에게 응답
            return ResponseEntity.ok().contentType(MediaType.TEXT_PLAIN).body(base64Image);
        } catch (Exception e) {
            // 오류 발생 시 처리
            e.printStackTrace();
            return ResponseEntity.status(HttpStatus.INTERNAL_SERVER_ERROR).body(null);
        }
    }
	
	public static String convertToBase64(File imageFile) throws IOException {
		// 이미지 파일을 읽어옴
		FileInputStream fis = new FileInputStream(imageFile);
		byte[] imageBytes = new byte[(int) imageFile.length()];
		fis.read(imageBytes);
		fis.close();
		
		// Base64로 변환
		return Base64.getEncoder().encodeToString(imageBytes);
	}
	
	
/*	@GetMapping("getImages")
    public ResponseEntity<List<FileVO>> getImages(@RequestParam("gfNo") String gfNo) {
		
        try {
        	List<FileVO> imageFile = fService.selectFileList(gfNo); // fileNo를 클라이언트로부터 받아와야 함
            
            // 이미지 파일을 Base64로 변환
        	List<FileVO> base64Image = convertToBase642(imageFile);
            
            // Base64로 변환된 이미지 데이터를 클라이언트에게 응답
            return ResponseEntity.ok().contentType(MediaType.APPLICATION_JSON).body(base64Image);
        } catch (Exception e) {
            // 오류 발생 시 처리
            e.printStackTrace();
            return ResponseEntity.status(HttpStatus.INTERNAL_SERVER_ERROR).body(null);
        }
    }
	
	public static String convertToBase642(List<FileVO> imageFiles) throws IOException {
		// 이미지 파일을 읽어옴
		for(FileVO vo : imageFiles) {
			File imageFile = vo.
            FileInputStream fis = new FileInputStream(imageFile);
            byte[] imageBytes = new byte[(int) imageFile.length()];
            fis.read(imageBytes);
            fis.close();

            // Base64로 변환하여 StringBuilder에 추가
            String base64Encoded = Base64.getEncoder().encodeToString(imageBytes);
			base64StringBuilder.append(base64Encoded);
		}
		
		// Base64로 변환
		return Base64.getEncoder().encodeToString(imageBytes);
	}*/
}
