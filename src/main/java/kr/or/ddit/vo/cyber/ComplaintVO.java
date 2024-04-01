package kr.or.ddit.vo.cyber;

import java.time.LocalDate;

import javax.validation.constraints.NotBlank;

import org.springframework.format.annotation.DateTimeFormat;
import org.springframework.format.annotation.DateTimeFormat.ISO;

import lombok.Data;
import okhttp3.internal.concurrent.Task;

@Data
public class ComplaintVO {
	
	private int rnum;
	
    @NotBlank
    private String cptNo;
    private String lecCode;
    private String cptType;
    private String cptComment;
    private String cptTitle;
    private String appStatus;
    private String appReject;
    private LocalDate cptDate;
    private String smemNo;
    //이의신청하고자 하는 PK
    private String cptCode;
    
    private String memName;
    private String deptName;
    
    //출결
    @DateTimeFormat(iso = DateTimeFormat.ISO.DATE)
    private LocalDate atDate;
    
    //과제
    private String taskCode;

    //팀플
    private String tpNo;
    private String teamNo;
    
    

}
