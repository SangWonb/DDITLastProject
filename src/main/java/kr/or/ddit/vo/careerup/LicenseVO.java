package kr.or.ddit.vo.careerup;

import javax.validation.constraints.NotBlank;

import lombok.Data;

@Data
public class LicenseVO {
	@NotBlank
	private String licenCode;
	private String licenNm;
	private String licenAuth;
}
