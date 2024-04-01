package kr.or.ddit.vo.info;

import java.time.LocalDateTime;
import java.time.format.DateTimeFormatter;

import javax.validation.constraints.NotBlank;

import org.springframework.format.annotation.DateTimeFormat;

import lombok.Data;

@Data
public class CounselVO {
	@NotBlank
	private String counsAppNo;
	private LocalDateTime counsDatetime;
	private String counsReason;
	private String counsMethod;
	private String counsType;	
	private String counsStatus;
	private String counsReject;
	private String memNo;
	private String counsPro;
	private String counsNo;
	private String counsContent;
	private String counsNotice;
	private String counsTitle;
	private String counsAddr;
	
	private int rnum;
	private int total;
	private Integer waiting;
	
	//이력조회에 사용
	private String studentName;
	private String professorName;
	private String statusNm;
	private String rejectReason; 
	private String deptName;
	private String type;
	
}
