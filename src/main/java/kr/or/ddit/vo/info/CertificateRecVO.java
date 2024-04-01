package kr.or.ddit.vo.info;

import java.time.LocalDate;

import javax.validation.constraints.NotBlank;

import lombok.Data;

@Data
public class CertificateRecVO {
	@NotBlank
	private String crtfRecno;
	@NotBlank
	private String memNo;
	@NotBlank
	private String crtfCode;
	private String crtfName;
	private LocalDate crtfDate;
	private Integer crtfQty;
	private Integer crtfAmt;
	private LocalDate crtfAppdate;
	private String crtfPay;
	private String impUid;
	private String merchantUid;
	private Integer crtfQtypt;
	private Integer crtfQtyrg;
}
