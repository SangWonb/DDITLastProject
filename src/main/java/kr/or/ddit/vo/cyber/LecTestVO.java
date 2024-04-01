package kr.or.ddit.vo.cyber;

import javax.validation.constraints.NotBlank;

import lombok.Data;

@Data
public class LecTestVO {
	@NotBlank
	private String ltCode;
	private String fileNo;
	private String ltCate; //중간고사인지 기말고사인지 => common 테이블에 정보 저장
	private String ltSem; //1학기 2학기 =>common 테이블
	private String ltTotalScore;
	private String ltGu; //온라인 시험인지 대면 시험인지
	private String ltTotalQ; //총 문항수
	private String ltTotalTime; //제한시간
	private String ltStartAble; //응시가능시간
	private String ltName; //시험이름
	private String ltType; //4지선다,5지선다
	private String ltDate;
	
	@NotBlank
	private String lecCode;
	
	private String tgRecord;
	private String ltDay;
	private String ltTime;
	
}
