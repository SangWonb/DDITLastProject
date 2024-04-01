package kr.or.ddit.vo.user;

import javax.validation.constraints.NotBlank;

import lombok.Data;

@Data
public class ManagerVO extends MemberVO {
	@NotBlank
	private String mmemNo;
	private String mmemState;
}
