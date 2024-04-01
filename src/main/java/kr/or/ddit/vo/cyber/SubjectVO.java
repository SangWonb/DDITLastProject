package kr.or.ddit.vo.cyber;

import java.io.Serializable;
import java.util.List;
import java.util.Map;

import javax.validation.constraints.NotBlank;

import kr.or.ddit.validate.DeleteGroup;
import kr.or.ddit.validate.InsertGroup;
import kr.or.ddit.vo.careerup.MenteeVO;
import lombok.Data;
import lombok.EqualsAndHashCode;

@Data
@EqualsAndHashCode(of = "subCode")
public class SubjectVO implements Serializable{
   private String rnum;
   private String subCode;
   private String statusCode;
   private String subName;
   private String subSchyear;
   private String majorCultural;
   private String choiceRequire;
   private Integer subSaved;
   @NotBlank(groups = DeleteGroup.class)
   private String subAppno;
   private Integer subCredit;
   private String rejectCode;
   @NotBlank(groups = InsertGroup.class)
   private String pmemNo;
   private String applDate;
   private String subSemester;
   private String deptCode;
   private String deptName;
   private String memName;
   private String lecaCode;
   private String lecCode;
   private String ltTime;
   
   private Map<String, String> reject;
   private Map<String, String> status;
   
   private List<LectureVO> lecture;
   private List<LectureApplyVO> lectureApply;
   private List<LecOpenListVO> lecOpenList;
   private List<DepartmentVO> department;
   private List<LectureTimeVO> ltTimes; //HAS MANY
}