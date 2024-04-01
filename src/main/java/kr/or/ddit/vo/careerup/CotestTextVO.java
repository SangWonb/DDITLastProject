package kr.or.ddit.vo.careerup;

import javax.validation.constraints.NotBlank;

import lombok.Data;

@Data
public class CotestTextVO {
	@NotBlank
	private String textCode;
	private String textNm;
	private Integer textScore;
	private String textGroup;
	private int rnum;
}
