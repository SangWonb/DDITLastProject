package kr.or.ddit.vo.careerup;

import java.time.LocalDate;

import javax.validation.constraints.NotBlank;

import lombok.Data;

@Data
public class VolunteerVO {
	@NotBlank
	private String volNo;
	private String volNm;
	private String volLoc;
	private String fileNo;
	private Integer volTime;
	private String yearSemester;
	private Integer volLimit;
	private LocalDate volDate;
	private String appNo;
}
