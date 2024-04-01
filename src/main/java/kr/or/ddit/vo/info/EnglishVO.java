package kr.or.ddit.vo.info;

import javax.validation.constraints.NotBlank;

import lombok.Data;

@Data
public class EnglishVO {
	@NotBlank
	private String engCode;
	private String engName;
	private String engScore;
}
