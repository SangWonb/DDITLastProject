package kr.or.ddit.vo.careerup;

import javax.validation.constraints.NotBlank;

import lombok.Data;

@Data
public class CoverLetterDetailVO {
	private int rnum;
	@NotBlank
	private String cldNo;
	private String cldTitle;
	private String cldContent;
	private String clNo;
	private String smemNo;
}
