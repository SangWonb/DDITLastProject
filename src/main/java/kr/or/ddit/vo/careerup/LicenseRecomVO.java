package kr.or.ddit.vo.careerup;

import java.io.Serializable;

import javax.validation.constraints.NotBlank;

import lombok.Data;
import lombok.EqualsAndHashCode;

@Data
@EqualsAndHashCode(of = { "licenDept", "licenJob" })
public class LicenseRecomVO implements Serializable {

	@NotBlank
	private String licenDept;
	@NotBlank
	private String licenJob;
	
	private String one;
	private String oneAuth;
	
	private String two;
	private String twoAuth;
	
	private String three;
	private String threeAuth;
}