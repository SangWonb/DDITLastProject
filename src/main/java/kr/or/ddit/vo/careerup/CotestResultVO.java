package kr.or.ddit.vo.careerup;

import java.time.LocalDate;

import javax.validation.constraints.NotBlank;

import lombok.Data;

@Data
public class CotestResultVO {
	
	@NotBlank
	private String cotestResultno;
	private String memNo;
	private LocalDate cotestDate;
	private int ca01;
	private int ca02;
	private int ca03;
	private int ca04;
	private int ca05;
	private int ca06;
	
	private String deptCode;
	private String deptName;
	private String colCode;
	private String colName;
}
