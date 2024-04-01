package kr.or.ddit.vo.careerup;

import java.io.Serializable;
import java.time.LocalDate;

import javax.validation.constraints.NotBlank;

import lombok.Data;
import lombok.EqualsAndHashCode;

@Data
@EqualsAndHashCode(of="emppgCode")
public class EmployProgramVO implements Serializable{
	private int rnum;
	@NotBlank
	private String emppgCode;
	private String emppgNm;
	private Integer emppgLimit;
	private LocalDate emppgStart;
	private LocalDate emppgEnd;
	private String emppgContent;
	private String emppgEtc;
	private String gfNo;
}
