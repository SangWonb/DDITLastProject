package kr.or.ddit.vo.info;

import java.time.LocalDate;

import javax.validation.constraints.NotBlank;

import lombok.Data;

@Data
public class CertificateRecPVO {
	@NotBlank
	private String crtfPRecno;
	@NotBlank
	private String memNo;
	@NotBlank
	private String crtfPCode;
	private String crtfPName;
	private LocalDate crtfPDate;
	private Integer crtfPQty;
	private LocalDate crtfPAppdate;
	private Integer crtfPQtypt;
	private Integer crtfPQtyrg;
}
