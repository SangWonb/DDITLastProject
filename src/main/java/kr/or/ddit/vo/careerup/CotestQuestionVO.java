package kr.or.ddit.vo.careerup;

import javax.validation.constraints.NotBlank;

import lombok.Data;

@Data
public class CotestQuestionVO {
	@NotBlank
	private String cotestQuesno;
	private String cotestArea;
	private String cotestQues;
	private String cotestAreaCode;
	private String textCode;
	private int rnum;
}
