package kr.or.ddit.vo.careerup;

import java.io.Serializable;
import java.time.LocalDate;

import javax.validation.constraints.NotBlank;

import lombok.Data;
import lombok.EqualsAndHashCode;

@Data
@EqualsAndHashCode(of = "chatId")
public class MentoringProgramVO implements Serializable {
	@NotBlank
	private String chatId;
	private LocalDate chatDate;
	@NotBlank
	private String menteeNo;
	@NotBlank
	private String srNo;
	private String memNo;
	
	private String memName;
	private String deptName;
}
