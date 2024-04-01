package kr.or.ddit.vo.cyber;

import javax.validation.constraints.NotBlank;

import lombok.Data;

@Data
public class LecSurveyResultVO {
	@NotBlank
	private String smemNo;
	@NotBlank
	private String lecCode;
	private double lsrIc;
	private double lsrCc;
	private double lsrCi;
	private double lsrTm;
	private double lsrAm;
	private double lsrTotal;
}
