package kr.or.ddit.vo.whole;

import java.util.UUID;

import javax.validation.constraints.NotBlank;

import org.apache.commons.io.FileUtils;
import org.apache.commons.lang3.builder.ToStringExclude;
import org.springframework.web.multipart.MultipartFile;

import com.fasterxml.jackson.annotation.JsonIgnore;

import lombok.Data;
import lombok.EqualsAndHashCode;
import lombok.NoArgsConstructor;

@Data
@EqualsAndHashCode(of = "fileNo")
@NoArgsConstructor
public class FileVO {
	
	@ToStringExclude
	@JsonIgnore
	private transient MultipartFile multiFile;
	
	public FileVO(MultipartFile multFile) {
		super();
		this.multiFile = multFile;
		fileNm = multFile.getOriginalFilename();
		fileSave = UUID.randomUUID().toString();
		mime = multFile.getContentType();
		fileSize = multFile.getSize();
		fancySize = FileUtils.byteCountToDisplaySize(fileSize);
	}
	
	private String fileNo;
	private String fileNm;
	private String fileSave;
	private String mime;
	private long fileSize;
	private String fancySize;
	private String gfNo;
}
