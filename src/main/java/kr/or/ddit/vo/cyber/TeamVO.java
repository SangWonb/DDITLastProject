package kr.or.ddit.vo.cyber;

import java.util.List;

import javax.validation.constraints.NotBlank;

import org.apache.commons.lang3.builder.ToStringExclude;
import org.springframework.web.multipart.MultipartFile;

import com.fasterxml.jackson.annotation.JsonIgnore;

import kr.or.ddit.vo.whole.FileVO;
import lombok.Data;

@Data
public class TeamVO {
	@NotBlank
	private String teamNo;
	@NotBlank
	private String tpNo;
	private String teamName;
	private String teamComment;
	private String teamproScore;
	private String gfNo;
	private String submitStatus;
	
	// 삭제할 파일들
	private String[] deleteFiles;
	
	// has many 관계
	private List<FileVO> fileList;
	
	@ToStringExclude
	@JsonIgnore
	private transient MultipartFile[] teamFiles;
	
	private List<TeamMemberVO> teamMemberList;

}
