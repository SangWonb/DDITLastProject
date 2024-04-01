package kr.or.ddit.vo.careerup;

import java.time.LocalDate;

import javax.validation.constraints.NotBlank;

import lombok.Data;

@Data
public class EmploymentReviewVO {
	private int rnum;
	@NotBlank
	private String empNo;
	@NotBlank
	private String smemNo;
	private String empTitle;
	private String empComment;
	private LocalDate empDate;
	private String memName;
	private String deptName;
}
