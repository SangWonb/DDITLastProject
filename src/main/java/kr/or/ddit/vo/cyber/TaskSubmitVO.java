package kr.or.ddit.vo.cyber;

import java.io.Serializable;
import java.util.List;

import javax.validation.constraints.NotBlank;

import org.apache.commons.lang3.builder.ToStringExclude;
import org.springframework.web.multipart.MultipartFile;

import com.fasterxml.jackson.annotation.JsonIgnore;

import kr.or.ddit.vo.user.StudentVO;
import kr.or.ddit.vo.whole.FileVO;
import lombok.Data;

@Data
public class TaskSubmitVO implements Serializable{
	
	@NotBlank
	private String taskCode;
	@NotBlank
	private String smemNo;
	private String gfNo;
	private String taskReply;
	private Integer taskScore;
	private String submitStatus;
	
	//has a 관계
	private StudentVO student;
	
	// 삭제할 파일들
	private String[] deleteFiles;

	// has many 관계
	private List<FileVO> fileList;
	
	@ToStringExclude
	@JsonIgnore
	private transient MultipartFile[] taskSubmitFiles;

}
