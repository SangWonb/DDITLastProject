package kr.or.ddit.vo.whole;

import java.time.LocalDate;

import javax.validation.constraints.NotBlank;

import lombok.Data;
import lombok.EqualsAndHashCode;

@Data
@EqualsAndHashCode(of = "appNo")
public class ApplicationVO {
	@NotBlank
	private String appNo;
	@NotBlank
	private String memNo;
	@NotBlank
	private String appCode;
	private String appStatus;
	private String appReject;
	private LocalDate appDate;
	private String yearSemester;
	private String fileNo;
}
