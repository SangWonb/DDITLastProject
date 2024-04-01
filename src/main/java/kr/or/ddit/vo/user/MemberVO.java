package kr.or.ddit.vo.user;

import java.util.List;

import javax.validation.constraints.NotBlank;
import javax.validation.constraints.Pattern;
import javax.validation.constraints.Size;

import kr.or.ddit.validate.DeleteGroup;
import kr.or.ddit.validate.UpdateGroup;
import lombok.Data;
import lombok.EqualsAndHashCode;

@Data
@EqualsAndHashCode(of = "memNo")
public class MemberVO {
	@NotBlank(groups = UpdateGroup.class)
	private String memNo;
	private String memName;
	@NotBlank(groups = DeleteGroup.class)
	@Pattern(regexp = "^(?=.*[a-zA-Z])(?=.*[0-9])(?=.*[\\!_]).{8,20}$", message = "비밀번호는 영문자, 숫자, 특수문자(!, _) 중 하나 이상을 포함하여 8~20자여야 합니다.", groups = DeleteGroup.class)
    @Size(min = 8, max = 20, message = "비밀번호는 8~20자여야 합니다.", groups = DeleteGroup.class)
    private String memPass;
	@NotBlank(groups = UpdateGroup.class)
	@Pattern(regexp="^[0-9]*$")
	private String memTel;
	private String memAddr1;
	private String memAddr2;
	private String memEmail;
	private String memReg1;
	private String memReg2;
	private String memBank;
	private String memDepo;
	private String memBanknum;
	private String gfNo;
	private String memSchedule;
	
	//has many관계
	private List<String> memRoles;
	private String memType;
	
	// reg1과 reg2를 조합한 생년월일(성별)
	private String bas;
	// col_name과 dept_name을 합친 것. ex) 공과대학 전자공학과 
	private String cad;
	
	//조회를 위해 필요한 다른 테이블의 컬럼들
	private String deptCode;
	private String colCode;
	private String deptName;
	private String colName;
	private String acCode;
	private String acName;
	private Integer stuMnl;
	private Integer stuMcl;
	private Integer stuCnl;
	private Integer stuCcl;
	//풀 주소!
	private String memAddr;
}
