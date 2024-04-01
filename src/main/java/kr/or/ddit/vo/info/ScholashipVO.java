package kr.or.ddit.vo.info;

import java.io.Serializable;

import javax.validation.constraints.NotBlank;

import kr.or.ddit.validate.DeleteGroup;
import kr.or.ddit.validate.UpdateGroup;
import lombok.Data;

@Data
public class ScholashipVO implements Serializable{
	private int rnum;
	@NotBlank(groups = {UpdateGroup.class, DeleteGroup.class})
	private String scholCode;
	private String scholName;
	private String scholCriteria;
	private String scholDm;
	private Integer scholAmt;
	private String scholRp;
}
