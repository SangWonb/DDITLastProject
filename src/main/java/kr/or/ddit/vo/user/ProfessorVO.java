package kr.or.ddit.vo.user;

import java.time.LocalDate;

import javax.validation.constraints.NotBlank;

import lombok.Data;

@Data
public class ProfessorVO extends MemberVO {
	@NotBlank
	private String pmemNo;
	@NotBlank
	private String deptCode;
	private LocalDate startDate;
	private String pmemStatus;
	private String pmemPosition;
	private String pmemResp;
	private String pmemTa;
	
	private String deptName;
	private String today;
	
	//재직증명서
	private String gfNo;
}
