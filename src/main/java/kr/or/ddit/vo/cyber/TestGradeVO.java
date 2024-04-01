package kr.or.ddit.vo.cyber;

import javax.validation.constraints.NotBlank;

import lombok.Data;

@Data
public class TestGradeVO {
	
	@NotBlank
	private String ltCode;
	@NotBlank
	private String smemNo;
	private String tgRecord;
	private String lhCode;
}
