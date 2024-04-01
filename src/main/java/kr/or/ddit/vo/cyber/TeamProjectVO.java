package kr.or.ddit.vo.cyber;

import java.util.List;

import javax.validation.constraints.NotBlank;

import org.apache.commons.lang3.builder.ToStringExclude;
import org.springframework.web.multipart.MultipartFile;

import com.fasterxml.jackson.annotation.JsonIgnore;

import kr.or.ddit.professor.cyber.task.vo.ProgressStatusVO;
import kr.or.ddit.vo.whole.FileVO;
import lombok.Data;

@Data
public class TeamProjectVO {
	@NotBlank
	private String lecCode;
	@NotBlank
	private String tpNo;
	private String tpName;
	private String tpDate;
	private Integer tpAssscore;
	private String gfNo;
	private String tpStatus;
	
	// has a 관계 >> DB에는 없는 vo
	private ProgressStatusVO progressStatus;
	
	// 삭제할 파일들
	private String[] deleteFiles;

	// has many 관계
	private List<FileVO> fileList;
	
	@ToStringExclude
	@JsonIgnore
	private transient MultipartFile[] teamProjectFiles;
	
	//학생용 팀 제출여부 표현
	private String submitStatus;
	//학생용 팀 번호
	private String teamNo;
	//학생용 팀 제출
	private TeamVO team;
	
	//has May 관계
	private List<TeamVO> teamList;
}
