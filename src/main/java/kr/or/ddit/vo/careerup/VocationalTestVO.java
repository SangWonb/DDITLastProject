package kr.or.ddit.vo.careerup;

import java.time.LocalDate;

import javax.validation.constraints.NotBlank;

import lombok.Data;

@Data
public class VocationalTestVO {
	@NotBlank
	private String votestCode;
	private String votestNm;
	private LocalDate votestTime;
}
