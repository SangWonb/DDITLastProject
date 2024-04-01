package kr.or.ddit.vo.cyber;

import lombok.Data;
import lombok.EqualsAndHashCode;

@Data
@EqualsAndHashCode(of = {"lolCode","ltDay"})
public class LectureTimeVO {
	
	private String lolCode;
	private String ltDay;
	private String ltTime;
	private String lpCode;
}
