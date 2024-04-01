package kr.or.ddit.vo.careerup;

import javax.validation.constraints.NotBlank;

import lombok.Data;

@Data
public class MileageVO {
	@NotBlank
	private String smemNo;
	private Integer mileIn;
	private Integer mileVol;
	private Integer milePro;
	private Integer mileTotal;
}
