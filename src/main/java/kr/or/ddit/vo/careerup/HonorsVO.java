package kr.or.ddit.vo.careerup;

import javax.validation.constraints.NotBlank;

import lombok.Data;

@Data
public class HonorsVO {
	@NotBlank
	private String honorsNo;
	@NotBlank
	private String smemNo;
	private String honorsNm;
	private String honorsAuth;
	private String honorsContent;
	private String fileNo;
}
