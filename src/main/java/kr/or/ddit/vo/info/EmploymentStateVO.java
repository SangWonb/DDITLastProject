package kr.or.ddit.vo.info;

import javax.validation.constraints.NotBlank;

import lombok.Data;

@Data
public class EmploymentStateVO {
	@NotBlank
	private String appCode;
	private String empState;
	private String empReason;
}
