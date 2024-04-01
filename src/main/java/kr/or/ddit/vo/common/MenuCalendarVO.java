package kr.or.ddit.vo.common;

import java.time.LocalDate;

import lombok.Data;

@Data
public class MenuCalendarVO {
	private int menucalCode;
	private LocalDate menucalSow;
	private LocalDate menucalEow;
}
