package kr.or.ddit.vo.cyber;

import javax.validation.constraints.NotBlank;

import lombok.Data;

@Data
public class LectureContentVO {
	@NotBlank
	private String lpNo;
	@NotBlank
	private String lpCode;
	private String lpContent;
}
