package kr.or.ddit.vo.cyber;

import java.time.LocalDate;
import java.util.List;

import javax.validation.constraints.NotBlank;

import org.apache.commons.lang3.builder.ToStringExclude;
import org.springframework.web.multipart.MultipartFile;

import com.fasterxml.jackson.annotation.JsonIgnore;

import kr.or.ddit.validate.InsertGroup;
import kr.or.ddit.validate.UpdateGroup;
import kr.or.ddit.vo.whole.FileVO;
import lombok.Data;

@Data
public class LectureAnnouncementVO {
	
	private int rnum;
	private String lecannNo;
	private String pmemNo;
	private String memName;
	
	private String lecannTitle;
	private String lecannContent;
	private String gfNo;
	private LocalDate lecannDate;
	@NotBlank
	private String lecCode;
	
	
	private String[] deleteFiles;
	   

	   // has many 관계
	   private List<FileVO> fileList;
	   
	   @ToStringExclude
	   @JsonIgnore
	   private transient MultipartFile[] laFiles;
}
