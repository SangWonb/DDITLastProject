package kr.or.ddit.vo.info;

import java.time.LocalDate;
import java.util.List;

import javax.validation.constraints.NotBlank;

import lombok.Data;

@Data
public class EnrollInvoiceVO {
	private int rnum;
	@NotBlank
	private String enrlNo;
	@NotBlank
	private String enrlCode;
	private LocalDate enrlDeadline;
	private String enrlBank;
	private String enrlAccount;
	@NotBlank
	private String scholCode;
	@NotBlank
	private String smemNo;
	private String year;
	private String semester;
	
	private EnrollfeeVO enrollfee;
	private List<EnrollRecordVO> enrollRecord;
	
	private String scholAmt;
	
	//교직원쪽에서 사용
	private String amt;
	private String real; //등록금-장학금
	private String real2; //수업료-장학금
	private String scholName;
	private String enrlTotal;
	private String enrlMc;
	private String enrlIf;
	private String enrlTf;
	private String enrlMf;
	private String deptName;
	private String deptCode;
	private String enrlDate;
	private String enrlRec;
	
}