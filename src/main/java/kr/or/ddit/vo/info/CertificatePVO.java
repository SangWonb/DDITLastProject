package kr.or.ddit.vo.info;

import javax.validation.constraints.NotBlank;

import lombok.Data;
import lombok.EqualsAndHashCode;

@Data
@EqualsAndHashCode(of="crtfPCode")
public class CertificatePVO {
		@NotBlank
		private String crtfPCode;
		private int rnum;
		private String crtfPName;
		private int crtfPAmt;
}
