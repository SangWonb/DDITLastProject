package kr.or.ddit.vo.cyber;

import java.io.Serializable;
import java.time.LocalDate;
import java.util.List;

import javax.validation.constraints.NotBlank;

import org.apache.commons.lang3.builder.ToStringExclude;
import org.springframework.format.annotation.DateTimeFormat;
import org.springframework.format.annotation.DateTimeFormat.ISO;
import org.springframework.web.multipart.MultipartFile;

import com.fasterxml.jackson.annotation.JsonIgnore;

import kr.or.ddit.vo.whole.FileVO;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@NoArgsConstructor
public class LectureOnlineVO implements Serializable{
	
	private int rnum;
	
	private String lecoCode;
	private String gfNo;
	private String memName;
	private String lecoContent;
	private String lecoTitle;
	private String lecCode;
	private Integer lecTime;
	@DateTimeFormat(iso = DateTimeFormat.ISO.DATE)
	private LocalDate lecoDate;
	
	//변환용
	private String lecoDateString;
	
	//동영상파일
	private String[] deleteFiles;
	private String filePath;

	   // has many 관계
	   private List<FileVO> fileList;
	   
	   @ToStringExclude
	   @JsonIgnore
	   private transient MultipartFile[] lecFiles;
	   private String fileNo;
		private String fileNm;
		private String fileSave;
		private String mime;
		private long fileSize;
		private String fancySize;
	
	
}
