package kr.or.ddit.vo.careerup;

import java.time.LocalDate;

import javax.validation.constraints.NotBlank;

import lombok.Data;

@Data
public class LicenseEnrollVO {
	private String licenEnrno;
	private String smemNo;
	private String licenCode;
	private String licenDate;
	private String licenNo;
	
	private LicenseVO license;
}
