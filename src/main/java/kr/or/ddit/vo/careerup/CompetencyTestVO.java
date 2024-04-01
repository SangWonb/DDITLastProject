package kr.or.ddit.vo.careerup;

import javax.validation.constraints.NotBlank;

import lombok.Data;

@Data
public class CompetencyTestVO {
	@NotBlank
	private String cotestCode;
	@NotBlank
	private String cotestQuesno;
}
