package kr.or.ddit.vo.info;

import java.time.LocalDate;
import java.util.List;
import java.util.Map;

import javax.validation.constraints.NotBlank;

import org.apache.commons.lang3.builder.ToStringExclude;
import org.springframework.web.multipart.MultipartFile;

import com.fasterxml.jackson.annotation.JsonIgnore;

import kr.or.ddit.vo.whole.FileVO;
import lombok.Data;

@Data
public class AcademicRecordChangeVO {
	@NotBlank
	private String arcNo;
	@NotBlank
	private String acCode;
	private String arcReason;
	private String arcYear;
	private String arcSemester;
	private int rnum;
	private String dateRange;
	private LocalDate arcDate;
	private LocalDate arcConfirmdate;
	private String gfNo;
	private String memNo;
	
	//교직원이 조회할 때 이력
	private String arcState;
	private String statusNm;
	private String arcReject;
	private String acName;
	private String memName;
	
	//학적변동신청(학생) - 조회
	private String rejectReason;
	private String value;
	private String deptCode;
	private String daptNmae;
	private String stuRecord;
	private String nowAc;
	private String smemSemester;
	private String stuGr;
	private String cad;
	private String bas;
	
	private Map<String,String> acaCla;
	private Map<String,String> status;
	private Map<String,String> reject;
	
	
	// 삭제할 파일들
	private String[] deleteFiles;

	// has many 관계
	private List<FileVO> fileList;
	
	@ToStringExclude
	@JsonIgnore
	private transient MultipartFile[] coFiles;
}
