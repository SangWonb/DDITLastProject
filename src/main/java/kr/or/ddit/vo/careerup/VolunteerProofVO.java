package kr.or.ddit.vo.careerup;

import javax.validation.constraints.NotBlank;

import lombok.Data;

@Data
public class VolunteerProofVO {
	@NotBlank
	private String appNo;
	private String volTime;
	private String volAuth;
	private Integer volContent;
}
