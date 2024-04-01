package kr.or.ddit.vo.careerup;

import java.io.Serializable;
import java.time.LocalDate;
import java.util.Map;

import javax.validation.constraints.NotBlank;

import kr.or.ddit.validate.InsertGroup;
import lombok.Data;
import lombok.EqualsAndHashCode;

@Data
@EqualsAndHashCode(of = "menteeNo")
public class MenteeVO implements Serializable{
	private int rnum;
	@NotBlank(groups = InsertGroup.class)
	private String menteeNo;
	private String menteeJob;
	private String menteeCom;
	@NotBlank(groups = InsertGroup.class)
	private String srNo;
	private String statusCode;
	private String rejectCode;
	private LocalDate menteeDate;
	private String memNo;
	private String memName;
	private String deptName;
	
//	private String chatId;

	private Map<String, String> reject;
	private Map<String, String> status;
	private Map<String, String> seniorCoworker;
}
