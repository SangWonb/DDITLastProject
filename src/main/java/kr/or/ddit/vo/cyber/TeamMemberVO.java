package kr.or.ddit.vo.cyber;

import javax.validation.constraints.NotBlank;

import lombok.Data;

@Data
public class TeamMemberVO {
	@NotBlank
	private String teamNo;
	@NotBlank
	private String smemNo;
	
	//임의로 넣은 내용
	private String memName;
	private String deptName;
	
}

