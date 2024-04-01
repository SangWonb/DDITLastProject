package kr.or.ddit.vo.common;

import java.util.Map;

import javax.validation.constraints.NotBlank;

import lombok.Data;
import lombok.EqualsAndHashCode;

@Data
@EqualsAndHashCode(of="mbti,sex,sub")
public class ClubRecomVO {
	
	@NotBlank
	public String mbti;
	@NotBlank
	public String sex;
	@NotBlank
	public String sub;
//	public List<Map<String,String>> ranking; // 1순위,2순위,3순위
	public String first; 
	public String second; 
	public String third; 
	
	

}
