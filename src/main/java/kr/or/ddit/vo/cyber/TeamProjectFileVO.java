package kr.or.ddit.vo.cyber;

import javax.validation.constraints.NotNull;

import lombok.Data;

@Data
public class TeamProjectFileVO {
	@NotNull
	private String tpCode;
	@NotNull
	private String teamNo;
	private String fileNo;
	private String tpPath;
	private String tpNo;
}
