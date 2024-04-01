package kr.or.ddit.vo.cyber;

import javax.validation.constraints.NotBlank;

import lombok.Data;

@Data
public class RegistrationVO {
	@NotBlank
	private String lhCode;
	
	private String lecCode;
	@NotBlank
	private String smemNo;
	
	
	//? 
	private String lhCredit;
	private String lhSemester;
	private Integer lhYear;
	private String lhLecname;
	private String lhProfessor;
	
}
