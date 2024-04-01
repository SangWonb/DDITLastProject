package kr.or.ddit.vo.common;

import java.io.Serializable;

import javax.validation.constraints.NotBlank;

import kr.or.ddit.vo.user.MemberVO;
import lombok.Data;
import lombok.EqualsAndHashCode;

@Data
@EqualsAndHashCode(of = "reviewNo")
public class RestaurantReviewVO implements Serializable{
	@NotBlank
	private String reviewNo;
	@NotBlank
	private String resAppno;
	@NotBlank
	private String memNo;
	private String reviewPrefer;
	private String reviewReply;
	
	//has a 관계 : >> 리뷰 작성자 개인정보가져오기용
	private MemberVO member;
	
}
