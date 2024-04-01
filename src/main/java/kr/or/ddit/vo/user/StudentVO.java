package kr.or.ddit.vo.user;

import java.time.LocalDate;
import java.util.List;
import java.util.Map;

import javax.validation.constraints.NotBlank;

import org.apache.commons.lang3.builder.ToStringExclude;
import org.springframework.web.multipart.MultipartFile;

import com.fasterxml.jackson.annotation.JsonIgnore;

import kr.or.ddit.validate.InsertGroup;
import kr.or.ddit.validate.UpdateGroup;
import kr.or.ddit.vo.careerup.LicenseEnrollVO;
import kr.or.ddit.vo.cyber.DepartmentVO;
import kr.or.ddit.vo.info.AcademicClassificationVO;
import kr.or.ddit.vo.whole.CommonVO;
import kr.or.ddit.vo.whole.FileVO;
import lombok.Data;
import lombok.ToString;

@Data
@ToString(callSuper = true)
public class StudentVO extends MemberVO {
	@NotBlank(groups = UpdateGroup.class)
	private String smemNo;
	@NotBlank(groups = InsertGroup.class)
	private String deptCode;
	private String smemSemester;
	private Integer stuMnl;
	private Integer stuMcl;
	private Integer stuCnl;
	private Integer stuCcl;
	private String stuJoinyear;
	private String stuGr;
	private String stuYn;
	
	//졸업자가진단 이수학점 조회
	private Integer totalMScore;
	private Integer totalFScore;
	private Integer totalScore;
	
	//재직증명서
	private String gfNo;
	
	//학적 상태
	private String stuRecord;
	private String stuGestatus;
	private String stuGtstatus;
	private String stuEnrollno;
	private LocalDate stuChange;
	//형식 변환한 학적변동 날짜
	private String stuChange2;
	
	//학생 과정 ex) 학사 4학년(9학기) 졸업 , 학사 4학년(9학기) 재학
	private String stuProg;
	
	//누가 쓰신 거죠?
	private String deptName;
	
	//학생 기준 학적상태랑 1:1
	private Map<String,AcademicClassificationVO> acaInfo;
	//학생 기준 학과랑 1:1
	private Map<String,DepartmentVO> deptInfo;
	//학생 기준 공통테이블(학기) 1:1
	private Map<String,CommonVO> commonInfo;
	
	private List<LicenseEnrollVO> licenseEnroll;
	
	@ToStringExclude
	@JsonIgnore
	private transient MultipartFile[] stuFiles;
	
	// 삭제할 파일들
	private String[] deleteFiles;

	// has many 관계
	private List<FileVO> fileList;
	
   //상담(교수) 쪽에서 쓰는 칼럼
   private String bas; //생년월일(성별) 형태
   private String cad; //단과대학+학과 형태
   private String acName; //학적상태

	
	//이성휘가 쓸 증명서컬럼
	private String enrlMf;
	private String enrlTf;
	private String enrlIf;
	private String enrlMc;
	private String enrlTotal;
	private String endate;
	private String stdate;
	private String today;
	
	//현재 학년
	private String grade;
}
