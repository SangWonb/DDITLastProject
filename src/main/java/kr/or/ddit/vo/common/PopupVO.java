package kr.or.ddit.vo.common;

import java.time.LocalDate;
import java.util.List;

import javax.validation.constraints.NotBlank;

import org.apache.commons.lang3.builder.ToStringExclude;
import org.springframework.format.annotation.DateTimeFormat;
import org.springframework.web.multipart.MultipartFile;

import com.fasterxml.jackson.annotation.JsonIgnore;

import kr.or.ddit.validate.DeleteGroup;
import kr.or.ddit.vo.whole.FileVO;
import lombok.Data;

@Data
public class PopupVO {
	@NotBlank(groups = DeleteGroup.class)
	private String popupCode;
	private String popupTitle;
	@DateTimeFormat(pattern = "yyyy-MM-dd")
	private LocalDate popupPeriod;
	private String gfNo;
	private String popupUrl;

	// 삭제할 파일들
	private String[] deleteFiles;

	// has many 관계
	private List<FileVO> fileList;
	
	@ToStringExclude
	@JsonIgnore
	private transient MultipartFile[] popFiles;
}
