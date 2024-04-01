package kr.or.ddit.professor.cyber.vo;

import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@NoArgsConstructor
public class TimeDataVO {
	
	
	public TimeDataVO(String dayIndex, String lolCode, String lolName, int startTimeIndex, int duringTime) {
		super();
		this.dayIndex = dayIndex;
		this.lolCode = lolCode;
		this.lolName = lolName;
		this.startTimeIndex = startTimeIndex;
		this.duringTime = duringTime;
	}
	
	private String dayIndex;
	private String lolCode;
	private String lolName;
	
	private int startTimeIndex;
	private int duringTime;
	
	
}
