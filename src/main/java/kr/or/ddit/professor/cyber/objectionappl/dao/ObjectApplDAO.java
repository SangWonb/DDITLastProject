package kr.or.ddit.professor.cyber.objectionappl.dao;

import java.lang.invoke.CallSite;
import java.util.List;

import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Param;

import kr.or.ddit.student.info.signupclasses.vo.SignUpVO;
import kr.or.ddit.utils.paging.PaginationInfo;
import kr.or.ddit.vo.common.CalendarVO;
import kr.or.ddit.vo.cyber.ComplaintVO;

@Mapper
public interface ObjectApplDAO {
	
	//교수 이의신청 조회 list
	public List<ComplaintVO> comListP(@Param("lecCode") String lecCode, @Param("paging") PaginationInfo paging);
	
	//교수 이의신청 조회(total record) list
	public int totalRecord(String lecCode);
	
	//학생 이의신청 조회(본인거만) list
	public List<ComplaintVO> comListS(@Param("lecCode") String lecCode, @Param("smemNo") String smemNo);
	
	//이의신청 조회
	public ComplaintVO selectCom(String cptNo);
	
	//이의신청 (학생)
	public int comInsert(ComplaintVO com);
	
	//이의신청 수정(승인/반려)
	public int comUpdate(ComplaintVO com);
	
	//이의신청 삭제(학생)
	public int comDelete(String cptNo);
	
	//이의신청 날짜 가져옴(시작날짜/끝날짜)
	public List<CalendarVO> selectObjectApplDay(SignUpVO signUp);
	
}
