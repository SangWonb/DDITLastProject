package kr.or.ddit.vo.info;

import javax.validation.constraints.NotBlank;

import lombok.Data;

@Data
public class GraduationCriteriaVO {
	@NotBlank
	private String grcrCode;
	@NotBlank
	private String engCode;
	@NotBlank
	private String deptCode;
	
	private String deptName;
	private String deptThesis;
	private String deptTest;
	private Integer deptMrc;
	private Integer deptMoc;
	private Integer deptCrc;
	private Integer deptCoc;
	
	private String engName;
	private String engScore;
}
