package kr.or.ddit.vo.careerup;

import java.time.LocalDate;

import javax.validation.constraints.NotBlank;

import lombok.Data;

@Data
public class VocationalTestResultVO {
	@NotBlank
	private String resultNo;
	@NotBlank
	private String votestCode;
	@NotBlank
	private String smemNo;
	private LocalDate votestDate;
	private Integer votestAn;
}
