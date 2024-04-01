package kr.or.ddit.vo.careerup;

import java.time.LocalDate;

import javax.validation.constraints.NotBlank;

import lombok.Data;

@Data
public class InternshipVO {
	@NotBlank
	private String internNo;
	private String companyNm;
	private String companyLoc;
	private String companyTel;
	private LocalDate companyStart;
	private LocalDate companyEnd;
	private String companyEmail;
	private String companyMethod;
	private String companyElig;
	private LocalDate companyDl;
	private Integer companyLimit;
	private LocalDate companyMeet;
	private Integer companyPay;
	@NotBlank
	private String appNo;
}
