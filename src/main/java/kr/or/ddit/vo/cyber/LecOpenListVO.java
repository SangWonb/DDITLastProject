package kr.or.ddit.vo.cyber;

import java.time.LocalDate;
import java.util.List;
import java.util.Map;

import javax.validation.constraints.NotBlank;

import kr.or.ddit.validate.DeleteGroup;
import kr.or.ddit.validate.InsertGroup;
import kr.or.ddit.vo.cyber.LecturePlanVO;
import lombok.Data;

@Data
public class LecOpenListVO {
	
	private String lolCode;
	@NotBlank(groups = InsertGroup.class)
	private String subCode;
	private Integer lolLimit;
	private Integer lolSaved;
	private Integer lolDaycount;
	@NotBlank(groups = DeleteGroup.class)
	private String lolAppno;
	private String roomNo;
	private String buildingNo;
	private Integer lecTime;
	private String pmemNo;
	private LocalDate lecAppno;
	private String appStatus;
	private String appReject;
	private String lolName;
	private String memName;
	private String ltDay;
	private String ltTime;
	private String lpCode;
	private String subName;
	
	//has many 관계
	private List<LectureTimeVO> lectureTimeList;
	
	// has a 관계
	private Map<String, String> subject;
	private Map<String, String> reject;
	private Map<String, String> status;
	private LecturePlanVO lecturePlan;
	
}
