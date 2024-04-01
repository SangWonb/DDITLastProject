package kr.or.ddit.vo.common;

import lombok.Data;
import lombok.EqualsAndHashCode;

@Data
@EqualsAndHashCode(of = {"bookCategory","age","deptCode"})
public class BookRecomVO {

	private String bookCategory;
	private String age;
	private String deptCode;
	private String one;
	private String two;
	private String three;
}
