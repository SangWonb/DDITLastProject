package kr.or.ddit.vo.cyber;

import javax.validation.constraints.NotBlank;

import lombok.Data;

@Data
public class CollegeVO {
	@NotBlank
	private String colCode;
	private String colName;
}
