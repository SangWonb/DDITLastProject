package kr.or.ddit.vo.info;

import javax.validation.constraints.NotBlank;

import lombok.Data;
import lombok.EqualsAndHashCode;

@Data
@EqualsAndHashCode(of="crtfCode")
public class CertificateVO {
	@NotBlank
	private String crtfCode;
	private int rnum;
	private String crtfName;
	private int crtfAmt;
}
