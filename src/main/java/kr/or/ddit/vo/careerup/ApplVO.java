package kr.or.ddit.vo.careerup;

import java.io.Serializable;
import java.time.LocalDate;
import java.util.Map;

import javax.validation.constraints.NotBlank;

import lombok.Data;

@Data
public class ApplVO implements Serializable {
	private int rnum;
	@NotBlank
	private String applNo;
	@NotBlank
	private String memNo;
	private String statusCode;
	private String rejectCode;
	private LocalDate emppgDate;
	@NotBlank
	private String applCode;
	private String gfNo;
	private String emppgNm;
	
	private Map<String, String> reject;
	private Map<String, String> status;
}
