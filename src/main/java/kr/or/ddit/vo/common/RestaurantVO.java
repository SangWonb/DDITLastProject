package kr.or.ddit.vo.common;

import java.io.Serializable;
import java.time.LocalDate;
import java.util.List;

import javax.validation.constraints.NotBlank;
import javax.validation.constraints.Pattern;
import javax.validation.constraints.Size;
import javax.validation.groups.Default;

import kr.or.ddit.validate.DeleteGroup;
import kr.or.ddit.validate.InsertGroup;
import kr.or.ddit.validate.UpdateGroup;
import kr.or.ddit.validate.constraints.TelNumber;
import kr.or.ddit.vo.whole.ApplicationVO;
import lombok.Data;
import lombok.EqualsAndHashCode;

@Data
@EqualsAndHashCode(of = "resAppno")
public class RestaurantVO implements Serializable {
	private int rnum;
	
	@NotBlank(groups = DeleteGroup.class) //delete는 defualt상속 안받음
	private String resAppno;
	
	@NotBlank(groups = {InsertGroup.class, UpdateGroup.class})
	private String resCode;
	
	@NotBlank(groups = {InsertGroup.class, UpdateGroup.class})
	@Size(max = 10, groups = {InsertGroup.class, UpdateGroup.class})
	private String resName;
	
	@NotBlank(groups = {InsertGroup.class, UpdateGroup.class})
	private String resLocation;
	
	@NotBlank(groups = {InsertGroup.class, UpdateGroup.class})
	@Pattern(regexp = "\\d{3,4}-\\d{3,4}-\\d{4}",groups = InsertGroup.class)
	private String resTel;
	
	private LocalDate resDate;
	private Integer resLike;
	private Integer resHate;
	private String memNo;
	private String resStatus;
	
	//has many 관계 : 식당의 리뷰들
	private List<RestaurantReviewVO> restaurantReviewList;
}

