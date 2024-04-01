package kr.or.ddit.vo.info;

import javax.validation.constraints.NotBlank;

import lombok.Data;

@Data
public class EnrollfeeVO {
	@NotBlank
	private String enrlCode;
	@NotBlank
	private String deptCode;
	private Integer enrlMf;
	private Integer enrlTf;
	private Integer enrlIf;
	private Integer enrlMc;
	private Integer enrlTotal;
}