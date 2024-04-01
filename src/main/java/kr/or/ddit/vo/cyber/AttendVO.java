package kr.or.ddit.vo.cyber;

import java.time.LocalDate;

import javax.validation.constraints.NotBlank;

import org.springframework.format.annotation.DateTimeFormat;

import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@NoArgsConstructor
public class AttendVO {
	
	public AttendVO(@NotBlank LocalDate atDate, @NotBlank String lecCode, @NotBlank String smemNo) {
		super();
		this.atDate = atDate;
		this.lecCode = lecCode;
		this.smemNo = smemNo;
		this.attendDateString = atDate.toString();
	}
	
	
	private String atNo;
	@NotBlank
	@DateTimeFormat(iso = DateTimeFormat.ISO.DATE)
	private LocalDate atDate;
	@NotBlank
	private String lecCode;
	@NotBlank
	private String smemNo;
	@NotBlank
	private String atCode;
	private String attendDateString;
	private String lecoCode;
}
