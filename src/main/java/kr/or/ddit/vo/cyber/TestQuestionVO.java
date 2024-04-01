package kr.or.ddit.vo.cyber;

import javax.validation.constraints.NotBlank;

import lombok.Data;

@Data
public class TestQuestionVO {
	private int tqNo;
	@NotBlank
	private String ltCode;
	private Integer tqAnswer;
	private String tqScore;
}
