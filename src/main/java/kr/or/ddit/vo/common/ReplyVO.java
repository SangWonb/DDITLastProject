package kr.or.ddit.vo.common;

import java.time.LocalDate;

import javax.validation.constraints.NotBlank;

import lombok.Data;

@Data
public class ReplyVO {
	@NotBlank
	private String replyNo;
	private String replyContent;
	private LocalDate replyDate;
	@NotBlank
	private String cmntCode;
	@NotBlank
	private String memNo;
	@NotBlank
	private String cmntNo;
}
