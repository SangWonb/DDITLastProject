package kr.or.ddit.vo.info;

import java.io.Serializable;
import java.time.LocalDate;

import javax.validation.constraints.NotBlank;

import lombok.Data;

@Data
public class ScholashipRecVO implements Serializable{
	private int rnum;
	@NotBlank
	private String scholNo;
	@NotBlank
	private String scholCode;
	@NotBlank
	private String smemNo;
	private LocalDate scholDate;
	private String yearSemester;
	
	private ScholashipVO scholaship;
	
	private String scholAmt;
	private String scholDm;
	
	// 장학통계
	private String scholName;
	private String deptName;
	private Integer count;
}
