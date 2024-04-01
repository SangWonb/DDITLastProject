package kr.or.ddit.vo.common;

import java.time.LocalDate;

import javax.validation.constraints.NotBlank;

import lombok.Data;

@Data
public class MenuVO {
	private int menuNo;
	private int menucalCode;
	@NotBlank
	private LocalDate menuDate;
	@NotBlank
	private String menuCode;
	@NotBlank
	private String menuName;
	@NotBlank
	private String menuFee;
	private String fileNo;
}
