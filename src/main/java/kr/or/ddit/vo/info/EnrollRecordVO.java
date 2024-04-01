package kr.or.ddit.vo.info;

import java.time.LocalDate;

import javax.validation.constraints.NotBlank;

import lombok.Data;

@Data
public class EnrollRecordVO {
	@NotBlank
	private String enrlRec;
	@NotBlank
	private String enrlNo;
	private LocalDate enrlDate;
}
