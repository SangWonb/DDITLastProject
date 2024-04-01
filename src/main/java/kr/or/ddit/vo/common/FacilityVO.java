package kr.or.ddit.vo.common;

import java.time.LocalDate;

import javax.validation.constraints.NotBlank;

import lombok.Data;

@Data
public class FacilityVO {
	@NotBlank
	private String facilityNo;
	private LocalDate facStarttime;
	private LocalDate facEndtime;
	private String buildingNo;
	private String roomNo;
}
