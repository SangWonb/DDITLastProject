package kr.or.ddit.vo.whole;

import javax.validation.constraints.NotBlank;

import lombok.Data;

@Data
public class BuildingVO {
	@NotBlank
	private String buildingNo;
	private String roomNo;
	private String deptCode;
}
