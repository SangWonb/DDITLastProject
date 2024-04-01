package kr.or.ddit.vo.info;

import java.time.LocalDate;

import javax.validation.constraints.NotBlank;

import lombok.Data;

@Data
public class CertificateGnoPVO {
	private int rnum;
	@NotBlank
	private String crtfPGno;
	private String crtfPRecno;
	private LocalDate crtfPDate;
	
	private Integer crtfPQtypt;
}
