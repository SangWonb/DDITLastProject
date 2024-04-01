package kr.or.ddit.vo.common;

import java.time.LocalDate;
import java.util.Map;

import javax.validation.constraints.NotBlank;

import lombok.Data;

@Data
public class BookRentalVO {
	private int rnum;
	@NotBlank
	private String rentCode;
	@NotBlank
	private String bookCode;
	@NotBlank
	private String memNo;
	private LocalDate rentStart;
	private LocalDate rentEnd;
	private String rentExpand;
	private String rentState;
	private Integer rentOverdue;
	
	private Map<String, BookVO> bookInfo;
	private String year;
	private String month;
	private String rentCount;
	private String stats;
	private String bookName;
	private String bookWriter;
	private String bookCategory;
}
