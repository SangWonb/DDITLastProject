package kr.or.ddit.vo.common;

import javax.validation.constraints.NotBlank;

import lombok.Data;
import lombok.EqualsAndHashCode;
import lombok.NoArgsConstructor;

@Data
@NoArgsConstructor
public class PortletVO {
	@NotBlank
	private String portCode;
	private String memNo;
	private Integer portNum;
	private String portCategory;
	private String portState;
	private String fileNo;
	private String x;
	private String y;
	private String w;
	private String h;
	private String locked;
	private String nomove;
	private String noresize;
	private String minw;
	private String minh;
	private String content;
	


}
