package kr.or.ddit.student.info.signupclasses.vo;

import java.time.LocalDate;

import javax.validation.groups.Default;

import org.springframework.format.annotation.DateTimeFormat;

import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@NoArgsConstructor
public class SignUpVO {
	//수강신청용
	
	public SignUpVO(int year, String semester) {
        super();
        this.year = year;
        this.semester = semester;

        switch (semester) {
            case "1학기":
                this.semesterStart = LocalDate.of(year, 1, 1);
                this.semesterEnd = LocalDate.of(year, 6, 30);
                break;
            case "2학기":
                this.semesterStart = LocalDate.of(year, 7, 1);
                this.semesterEnd = LocalDate.of(year, 12, 31);
                break;
        }
    }

    private String smemNo;
    private int year;
    private String semester;
    private String deptCode;
    private String lecCode;
    //학년
    private String schoolYear;
    
    
    @DateTimeFormat(pattern = "yy/MM/dd")
    private LocalDate semesterStart;
    @DateTimeFormat(pattern = "yy/MM/dd")
    private LocalDate semesterEnd;

    // 검색 조건
    private String selectPart; // 소속학과(D)/교양(R)/타학과(O)
    private String subName;
    private String lolName;
    private String subCode;

    public LocalDate getSemesterStart() {
        switch (this.semester) {
            case "1학기":
                return LocalDate.of(year, 1, 1);
            default:
                return LocalDate.of(year, 7, 1);
        }
    }

    public LocalDate getSemesterEnd() {
        switch (this.semester) {
            case "1학기":
                return LocalDate.of(year, 6, 30);
            default:
                return LocalDate.of(year, 12, 31);
        }
    }

	
}

