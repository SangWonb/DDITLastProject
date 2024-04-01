package kr.or.ddit.vo.careerup;

import java.io.Serializable;
import java.time.LocalDateTime;

import javax.validation.constraints.NotBlank;

import lombok.Data;

@Data
public class MentoringMessageVO implements Serializable{
	@NotBlank
	private String chatId;
	@NotBlank
	private String memNo;
	private String chatMessage;
	private LocalDateTime chatTime;
	private String memName;
}
