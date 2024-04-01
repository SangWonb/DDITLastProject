package kr.or.ddit.vo.common;

import java.io.Serializable;
import java.time.LocalDateTime;
import java.util.List;

import javax.validation.constraints.NotBlank;

import org.apache.commons.lang3.builder.ToStringExclude;
import org.springframework.format.annotation.DateTimeFormat;
import org.springframework.web.multipart.MultipartFile;

import com.fasterxml.jackson.annotation.JsonIgnore;

import kr.or.ddit.validate.DeleteGroup;
import kr.or.ddit.validate.UpdateGroup;
import kr.or.ddit.vo.whole.FileVO;
import lombok.Data;
import lombok.EqualsAndHashCode;

@Data
@EqualsAndHashCode(of="cmntCode")
public class CommunityVO implements Serializable {
	private int rnum;
	@NotBlank(groups = {UpdateGroup.class,DeleteGroup.class} )
	private String cmntCode;
	private String cmntTitle;
	private String cmntContent;
	@DateTimeFormat(pattern ="yyyy-MM-dd HH:mm")
	private LocalDateTime cmntDate;
	private Integer cmntCount;
	private String gfNo;
	private String boParent;
	private String memNo;
	private String deptCode;
	private String memName;
	private String level;
	private String password;
	// 삭제할 파일들
	private String[] deleteFiles;
	

	// has many 관계
	private List<FileVO> fileList;
	
	@ToStringExclude
	@JsonIgnore
	private transient MultipartFile[] coFiles;
	
}
