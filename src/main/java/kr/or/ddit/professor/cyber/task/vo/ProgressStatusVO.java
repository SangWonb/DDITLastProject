package kr.or.ddit.professor.cyber.task.vo;

import lombok.Data;

@Data
public class ProgressStatusVO {
	
	public ProgressStatusVO(int completion, int allCount) {
		super();
		this.completion = completion;
		this.allCount = allCount;
		this.unfinished = allCount - completion;
		this.completionRate = (int) (((double)completion/(double)allCount) * 100);
	}

	//완료률
	private int completionRate;
	
	//완료
	private int completion;
	
	//미완
	private int unfinished;
	
	//전체 할당된 학생 수
	private int allCount;
}
