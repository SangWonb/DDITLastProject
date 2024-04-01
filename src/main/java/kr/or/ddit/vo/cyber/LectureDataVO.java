package kr.or.ddit.vo.cyber;

import java.time.LocalDate;
import java.util.List;

import javax.validation.constraints.NotBlank;

import org.apache.commons.lang3.builder.ToStringExclude;
import org.springframework.web.multipart.MultipartFile;

import com.fasterxml.jackson.annotation.JsonIgnore;

import kr.or.ddit.validate.DeleteGroup;
import kr.or.ddit.validate.InsertGroup;
import kr.or.ddit.validate.UpdateGroup;
import kr.or.ddit.vo.whole.FileVO;
import lombok.Data;

@Data
public class LectureDataVO {
	@NotBlank(groups = {UpdateGroup.class, DeleteGroup.class})
	private String lecDatano;
	@NotBlank(groups = InsertGroup.class)
	private String lecCode;
	private String gfNo;
	private String lecDataname;
	private String lecDatacontent;
	private LocalDate lecDate;
	@NotBlank(groups = InsertGroup.class)
	private String memName;
	
	// 삭제할 파일들
	private String[] deleteFiles;

	// has many 관계
	private List<FileVO> fileList;
	
	@ToStringExclude
	@JsonIgnore
	private transient MultipartFile[] daFiles;
}
