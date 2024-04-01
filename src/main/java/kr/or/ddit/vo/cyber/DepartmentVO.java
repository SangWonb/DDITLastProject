package kr.or.ddit.vo.cyber;

import java.io.Serializable;
import java.util.Map;

import javax.validation.constraints.NotBlank;

import lombok.Data;

@Data
public class DepartmentVO implements Serializable {
	@NotBlank
	private String deptCode;
	@NotBlank
	private String colCode;
	private String deptName;
	private Integer deptMrc;
	private Integer deptMoc;
	private Integer deptCrc;
	private Integer deptCoc;
	private String deptTel;
	private String deptThesis;
	private String deptTest;
	
	//학과 기준으로 단과대학이랑 1:1
	private Map<String, CollegeVO> colInfo;
	
	//졸업자가진단 이수학점 조회
	private String smemNo;
	private Integer totalMrScore;
	private Integer totalCrScore;
	private Integer totalDScore;
}
