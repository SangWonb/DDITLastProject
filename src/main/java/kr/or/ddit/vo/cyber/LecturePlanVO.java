package kr.or.ddit.vo.cyber;

import java.io.Serializable;
import java.util.List;

import javax.validation.constraints.NotBlank;

import kr.or.ddit.validate.DeleteGroup;
import lombok.Data;
import lombok.EqualsAndHashCode;

@Data
@EqualsAndHashCode(of = "lpCode")
public class LecturePlanVO implements Serializable {
	private int rnum;
	@NotBlank(groups = DeleteGroup.class)
	private String lpCode;
	private String lpContent;
	private Integer lpAttendRef;
	private Integer lpTestRef;
	private Integer lpTaskRef;
	private String lpNote;
	private Integer lpScore;
	private String lpBook;
	@NotBlank
	private String pmemNo;
	@NotBlank(groups = DeleteGroup.class)
	private String lolCode;
	@NotBlank
	private String lolAppno;
	
	private String lecCode;
	
    private String lolLimit;
    private String ltDay;
    private String ltTime;
    private String subName;
    private String subSchYear;
    private String majorCultural;
    private String choiceRequire;
    
    private LecOpenListVO lecOpenList;
    private LectureTimeVO lectureTime;
    // has many 관계
    private List<LectureContentVO> lectureContent;
}
