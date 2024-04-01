package kr.or.ddit.vo.common;

import java.time.LocalDate;

import javax.validation.constraints.NotBlank;

import lombok.Data;

@Data
public class CalendarVO {
	@NotBlank
	private String cldrCode;
	@NotBlank
	private String cldrType;
	@NotBlank
	private String memNo;
	private String cldrMemo;
	private LocalDate cldrStart;
	private LocalDate cldrEnd;
	private String cldrColor;

	private String deptCode;
	
	//클라이언트가 고른 캘린더의 종류
	// ex) m=> 내일정 a=>학사 d=>학과 m ma md mad a ad d
	private String category;
}
