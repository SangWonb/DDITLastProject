package kr.or.ddit.manager.com.popup.mainpopup.controller;

import java.io.File;
import java.io.FileInputStream;
import java.io.IOException;
import java.util.Base64;
import java.util.List;

import javax.inject.Inject;

import org.springframework.http.HttpStatus;
import org.springframework.http.MediaType;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.validation.annotation.Validated;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import kr.or.ddit.enumpkg.ServiceResult;
import kr.or.ddit.manager.com.popup.mainpopup.service.MainPopupServiceM;
import kr.or.ddit.utils.file.service.FTPFileService;
import kr.or.ddit.validate.InsertGroup;
import kr.or.ddit.vo.common.PopupVO;

@Controller
@RequestMapping("/manager/com/popup/mainpopup")
public class MainPopupControllerM {
	
	@Inject
	MainPopupServiceM service;
	@Inject
	FTPFileService fService;
	
	@GetMapping("mainPopup")
	public String list(Model model) {
		List<PopupVO> popupList = service.retrievePopupList();
		model.addAttribute("popupList", popupList);
		model.addAttribute("contentTitle", "팝업 관리");
		return "tiles:manager/com/popup/mainpopup/mainPopup";
	}
	
	@GetMapping("detailPopup/{popupCode}")
	public String detail(@PathVariable String popupCode, Model model) {
		PopupVO popup = service.retrievePopup(popupCode);
		model.addAttribute("popup", popup);
		return "manager/com/popup/mainpopup/detailPopup";
	}
	
	@ModelAttribute("popup")
	public PopupVO popupInsert() {
		return new PopupVO();
	}
	
	@GetMapping("popupInsertForm")
	public String insertForm(Model model) {
	    return "manager/com/popup/mainpopup/popupInsertForm";
	}
	
	@PostMapping("popupInsertForm")
	public String insertProcess(
	    @Validated(InsertGroup.class) 
	    @ModelAttribute ("popup") PopupVO vo,
	    BindingResult errors,
	    Model model
	) throws Exception {
	    String logicalViewName = null;
	    if (!errors.hasErrors()) {
	        ServiceResult result = service.createPopup(vo);
	        String message = null;
	        switch (result) {
	            case OK:
	                logicalViewName = "redirect:/manager/com/popup/mainpopup/mainPopup";
	                break;
	            default:
	                logicalViewName = "manager/com/popup/mainpopup/popupInsertForm";
	                message = "다시 입력 바람";
	                break;
	        }
	        model.addAttribute("message", message);
	    } else {
	        logicalViewName = "manager/com/popup/mainpopup/popupInsertForm";
	    }
	    return logicalViewName;
	}
	
	// 업데이트 폼
	@GetMapping("popupEditForm/{popupCode}")
	public String editForm(@PathVariable String popupCode, 
			@ModelAttribute("popup") PopupVO vo,
			Model model) {
		PopupVO popup = service.retrievePopup(popupCode);
		model.addAttribute("popup", popup);
	    return "manager/com/popup/mainpopup/popupEditForm";
	}
	
	@PostMapping("popupEditForm")
	public String editProcess(
	    @Validated(InsertGroup.class) 
	    @ModelAttribute ("popup") PopupVO vo,
	    BindingResult errors,
	    Model model
	) {
	    String logicalViewName = null;
	    if (!errors.hasErrors()) {
	        ServiceResult result = service.modifyPopup(vo);
	        String message = null;
	        switch (result) {
	            case OK:
	                logicalViewName = "redirect:/manager/com/popup/mainpopup/mainPopup";
	                break;
	            default:
	                logicalViewName = "manager/com/popup/mainpopup/popupEditForm";
	                message = "다시 입력 바람";
	                break;
	        }
	        model.addAttribute("message", message);
	    } else {
	        logicalViewName = "manager/com/popup/mainpopup/popupEditForm";
	    }
	    return logicalViewName;
	}
	
	@PostMapping("del")
	public String delete(@RequestParam String popupCode, Model model) {
		service.removePopup(popupCode);
		return "redirect:/manager/com/popup/mainpopup/mainPopup";
	}
	
	@GetMapping("viewPopup")
	public String view(Model model) {
//		model.addAttribute("message", message);
		return "manager/com/popup/mainpopup/viewPopup";
	}
	
	@GetMapping("viewPopup/getImage")
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
}