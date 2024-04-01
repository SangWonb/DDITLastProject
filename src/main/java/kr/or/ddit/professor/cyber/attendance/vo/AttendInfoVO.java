package kr.or.ddit.professor.cyber.attendance.vo;

import java.util.List;

import kr.or.ddit.vo.cyber.AttendVO;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@NoArgsConstructor
public class AttendInfoVO {
	
	public AttendInfoVO(String smemNo, String memName, String deptName, String lecCode) {
		super();
		this.smemNo = smemNo;
		this.memName = memName;
		this.deptName = deptName;
		this.lecCode = lecCode;
	}

	private String smemNo;
	private String memName;
	private String deptName;
	private String lecCode;
	
	//실시일수
	private int conducted;
	//출석(+공결)
	private int attendance;
	//결석
	private int absent;
	//지각
	private int late;
	//조퇴
	private int leave;
	
	private List<AttendVO> attendList;
	
}
