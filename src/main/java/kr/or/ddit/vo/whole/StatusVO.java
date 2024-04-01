package kr.or.ddit.vo.whole;

import javax.validation.constraints.NotBlank;

import lombok.Data;

@Data
public class StatusVO {
	@NotBlank
	private String statusCode;
	private String statusNm;
}
