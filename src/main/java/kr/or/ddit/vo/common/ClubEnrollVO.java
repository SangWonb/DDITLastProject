package kr.or.ddit.vo.common;

import javax.validation.constraints.NotBlank;

import lombok.Data;

@Data
public class ClubEnrollVO {
	@NotBlank
	private String smemNo;
	@NotBlank
	private String clubNo;
	private String clubSub;
	private String clubMbti;
	private String clubSex;
}
