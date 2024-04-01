package kr.or.ddit.vo.common;

import java.time.LocalDate;
import java.util.Map;

import javax.validation.constraints.NotBlank;

import lombok.Data;
import lombok.EqualsAndHashCode;

@Data
@EqualsAndHashCode(of="clubNo")
public class ClubVO {
	@NotBlank
	private String clubNo;
	private String clubLeader;
	private String pro;
	private String clubCategory;
	private String clubName;
	private String clubGf;
	private String clubContent;
	private String clubAppno;
	private LocalDate clubAppdate;
	private LocalDate clubDate;
	private int clubViews;
	private int clubMem;
//	private String clubStatus;
	
	private Map<String,String> status; 
	private Map<String,String> reject;
	
	private int rnum;
}
