package kr.or.ddit.vo.cyber;

import javax.validation.constraints.NotBlank;

import lombok.Data;

@Data
public class LecSurveyContentVO {
	@NotBlank
	private String lsNo;
	private String lsType;
	private String lsContent;
	
	//선택한 점수
	private int satis;
}
