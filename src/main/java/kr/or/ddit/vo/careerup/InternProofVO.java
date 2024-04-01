package kr.or.ddit.vo.careerup;

import javax.validation.constraints.NotBlank;

import lombok.Data;

@Data
public class InternProofVO {
	@NotBlank
	private String ifNo;
	@NotBlank
	private String smemNo;
	private String ifNm;
	private String ifDate;
	private String ifCompany;
	private String ifEmail;
	private String ifContent;
}
