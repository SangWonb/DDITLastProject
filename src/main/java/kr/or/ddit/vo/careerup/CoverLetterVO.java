package kr.or.ddit.vo.careerup;

import javax.validation.constraints.NotBlank;

import lombok.Data;

@Data
public class CoverLetterVO {
	private int rnum;
	@NotBlank
	private String clNo;
	@NotBlank
	private String smemNo;
	private String clKey;
	
	@NotBlank
	private String cldNo;
	private String cldTitle;
	private String cldContent;
}
