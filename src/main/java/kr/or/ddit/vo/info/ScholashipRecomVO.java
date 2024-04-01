package kr.or.ddit.vo.info;

import javax.validation.constraints.NotBlank;

import lombok.Data;

@Data
public class ScholashipRecomVO {
	@NotBlank
	private String scholRecomno;
	@NotBlank
	private String scholCode;
}
