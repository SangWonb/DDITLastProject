package kr.or.ddit.student.cyber.dao;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Param;

import kr.or.ddit.student.info.signupclasses.vo.SignUpVO;
import kr.or.ddit.utils.paging.PaginationInfo;
import kr.or.ddit.vo.cyber.LecOpenListVO;
import kr.or.ddit.vo.cyber.LectureVO;

@Mapper
public interface CyberMainDAOS {
	
	//시간표 조회
	public List<LecOpenListVO> selectLOLListS(@Param("smemNo") String smemNo, @Param("signUp") SignUpVO signUp);
	
	//강의 목록 조회
	public List<LectureVO> selectLectureListS(@Param("smemNo") String smemNo, @Param("paging") PaginationInfo paging, @Param("signUp") SignUpVO signUp);
	
	//강의 목록 전체 개수 조회
	public int selectTotalRecord(@Param("smemNo") String smemNo, @Param("signUp") SignUpVO signUp);
	
}
