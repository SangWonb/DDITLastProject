package kr.or.ddit.vo.cyber;

import java.util.List;

import javax.validation.constraints.NotBlank;

import kr.or.ddit.validate.UpdateGroup;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@NoArgsConstructor
public class LectureVO {
	
	private int rnum;
	
	@NotBlank(groups = UpdateGroup.class)
	private String lecCode;
	private String lecState;
	@NotBlank
	private String lolCode;
	private String lecType;
	private Integer lecTime;
	private String gfNo;
	private String buildingNo;
	private String roomNo;
	
	//has a 관계
	private LecOpenListVO lol;
	
	//임의로 넣은 내용
	private String memName; //교수 이름
	
	//수강신청용
	private String subCode;
	private String subName;
	private String lolName;
	private String subSchyear;
	private String majorCultural;
	private String choiceRequire;
	private String subCredit;
	private String subSemester;
	private String deptName;
	private String pmemNo;
	
	private String smemNo;
	
	//이수구분 >> ex)전필
	private String subMC;
	
	//신청 인원
	private Integer lecSignUp;
	//정원
	private Integer lolLimit;

	private List<LectureTimeVO> lecTimeList;
	
	public String getSubMC() {
		if (this.majorCultural != null && this.choiceRequire != null) {
	        return this.majorCultural.substring(0, 1) + this.choiceRequire.substring(0,1);
	    } else {
	        return ""; // 또는 다른 기본값을 반환할 수도 있습니다.
	    }
	}
	
	//[월|09:00~13:00][화|09:00~13:00] >> 로 표현
	private String lectureTime;
	
	
}
