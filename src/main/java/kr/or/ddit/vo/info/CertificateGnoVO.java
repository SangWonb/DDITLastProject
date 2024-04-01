package kr.or.ddit.vo.info;

import java.time.LocalDate;

import javax.validation.constraints.NotBlank;

import lombok.Data;

@Data
public class CertificateGnoVO {
	private int rnum;
	@NotBlank
	private String crtfGno;
	private String crtfRecno;
	private LocalDate crtfDate;
	
	private Integer crtfQtypt;
}
