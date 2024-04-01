package kr.or.ddit.vo.whole;

import javax.validation.constraints.NotBlank;

import lombok.Data;

@Data
public class RejectVO {
	@NotBlank
	private String rejectCode;
	private String rejectReason;
}
