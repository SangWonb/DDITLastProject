package kr.or.ddit.professor.cyber.attendance.vo;

import java.time.LocalDate;

import org.springframework.format.annotation.DateTimeFormat;

import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@NoArgsConstructor
public class DayVO {

	public DayVO(int week, int month, int day, String dayName, LocalDate date) {
		super();
		this.week = week;
		this.month = month;
		this.day = day;
		this.dayName = dayName;
		this.date = date;
	}
	
	private int week;
	private int month;
	private int day;
	private String dayName;
	@DateTimeFormat(pattern = "yy/MM/dd")
	private LocalDate date;
	
}
