package kr.or.ddit.vo.common;

import javax.validation.constraints.NotBlank;

import lombok.Data;
import lombok.EqualsAndHashCode;

@Data
@EqualsAndHashCode(of = "bookCode")
public class BookVO {
	private int rnum;
	@NotBlank
	private String bookCode;
	private String bookName;
	private String bookWriter;
	private String bookCompany;
	private String bookCategory;
	private String bookState;
	private String bookContent;
	
	private String stats;
}
