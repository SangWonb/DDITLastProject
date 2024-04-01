package kr.or.ddit.vo.common;

import lombok.Data;
import lombok.EqualsAndHashCode;

@Data
@EqualsAndHashCode(of = {"resGroup","resSex","resAge"})
public class RestaurantRecomVO {
	
	private String resGroup;
	private String resSex;
	private String resAge;
	private String one;
	private String two;
	private String three;
	private String four;
	private String five;
	
}
