package kr.or.ddit.vo.cyber;

import java.io.Serializable;
import java.util.List;

import javax.validation.constraints.NotBlank;

import org.apache.commons.lang3.builder.ToStringExclude;
import org.springframework.web.multipart.MultipartFile;

import com.fasterxml.jackson.annotation.JsonIgnore;

import kr.or.ddit.professor.cyber.task.vo.ProgressStatusVO;
import kr.or.ddit.vo.whole.FileVO;
import lombok.Data;

@Data
public class TaskVO implements Serializable{
	
	@NotBlank
	private String taskCode;
	@NotBlank
	private String lecCode;
	private String taskContent;
	private String taskPeriod;
	private String taskTitle;
	private String totalScore;
	private String taskStatus;
	private String gfNo;
	// has a 관계 >> DB에는 없는 vo
	private ProgressStatusVO progressStatus;
	
	// 삭제할 파일들
	private String[] deleteFiles;

	// has many 관계 //조회를 위해 있음 >> 실제 파일 탐색이 아니라, db에 저장된 내용
	private List<FileVO> fileList;
	
	@ToStringExclude
	@JsonIgnore
	private transient MultipartFile[] taskFiles;
	
	//학생용 제출여부 표현
	private String submitStatus;
	
	//학생이 제출한것
	private TaskSubmitVO taskSubmit;
}
