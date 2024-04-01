package kr.or.ddit.vo.info;

import javax.validation.constraints.NotBlank;

import lombok.Data;

@Data
public class AcademicClassificationVO {
	@NotBlank
	private String acCode;
	private String acName;
	private String acNeed;
}
