package kr.or.ddit.vo.careerup;

import javax.validation.constraints.NotBlank;

import lombok.Data;

@Data
public class EmploymentPlaceVO {
	private int rnum;
	@NotBlank
	private String emplCode;
	private String titleName;
	private String limitDate;
	private String companyName;
	private String emplUrl;
}
