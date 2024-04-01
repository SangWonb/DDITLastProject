package kr.or.ddit.vo.common;

import javax.validation.constraints.NotBlank;

import lombok.Data;

@Data
public class GuideVO {
	@NotBlank
	private String guideNo;
	private String guideTitle;
	private String guideContent;
	private String guideCategory;
}
