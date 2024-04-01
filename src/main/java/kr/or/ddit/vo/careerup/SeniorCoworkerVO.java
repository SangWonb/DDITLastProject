package kr.or.ddit.vo.careerup;

import java.io.Serializable;

import javax.validation.constraints.NotBlank;

import kr.or.ddit.validate.BywGroup;
import kr.or.ddit.validate.UpdateGroup;
import kr.or.ddit.vo.user.StudentVO;
import lombok.Data;
import lombok.EqualsAndHashCode;
import lombok.ToString;

@Data
@ToString(callSuper = true)
@EqualsAndHashCode(of = "srNo")
public class SeniorCoworkerVO extends StudentVO implements Serializable {
	private int rnum;
	@NotBlank(groups = UpdateGroup.class)
	private String srNo;
	@NotBlank(groups = BywGroup.class)
	private String smemNo;
	private String companyNm;
	private String companyDept;
	private String companyJob;
	private String companyLoc;
	private String srW;
	private String companyType;
	private String deptName;
	private String memName;
	private int count;
	
	private String ifCompany;
	private String ifDate;
	private String langType;
	private String langScore;
	private String honorsNm;
	private String colName;
}
