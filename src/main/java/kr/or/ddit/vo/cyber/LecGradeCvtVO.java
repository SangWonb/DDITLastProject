package kr.or.ddit.vo.cyber;

import javax.validation.constraints.NotBlank;

import lombok.Data;

@Data
public class LecGradeCvtVO {
	
	private int rnum;
	
	@NotBlank
	private String lgcCode;
	@NotBlank
	private String lecCode;
	private String smemNo;
	private Integer lgcAttend;
	private Integer lgcMidterm;
	private Integer lgcFinal;
	private Integer lgcTask; //과제+팀플
	private Integer lgcRanking; //석차
	private Integer lgcPercent; //백분율
	private Integer lgcTotalscore; //총점
	private String lgcGrade; //등급
	
	private LectureVO lectureVO;
	
	//학생 상세정보
	private String memName;
	private String deptName;
	
}
