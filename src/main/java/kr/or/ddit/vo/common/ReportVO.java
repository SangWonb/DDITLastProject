package kr.or.ddit.vo.common;

import javax.validation.constraints.NotBlank;

import lombok.Data;

@Data
public class ReportVO {
	@NotBlank
	private String reportNo;
	private String reportReason;
	@NotBlank
	private String cmntCode;
	@NotBlank
	private String cmntNo;
}
