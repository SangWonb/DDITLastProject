package kr.or.ddit.vo.cyber;

import javax.validation.constraints.NotBlank;

import lombok.Data;

@Data
public class LectureApplyVO {
	@NotBlank
	private String lecaCode;
	private String lecCode;
	private String smemNo;
}
