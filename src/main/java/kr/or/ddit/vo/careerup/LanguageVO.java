package kr.or.ddit.vo.careerup;

import javax.validation.constraints.NotBlank;

import lombok.Data;

@Data
public class LanguageVO {
	@NotBlank
	private String langCode;
	@NotBlank
	private String smemNo;
	private String langNm;
	private String langType;
	private String langScore;
	private String langAuth;
	private String fileNo;
}
