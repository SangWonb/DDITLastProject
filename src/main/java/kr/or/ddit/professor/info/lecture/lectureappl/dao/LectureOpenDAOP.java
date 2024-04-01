package kr.or.ddit.professor.info.lecture.lectureappl.dao;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;

import kr.or.ddit.utils.abMapper.AbstractCommonMapper;
import kr.or.ddit.vo.cyber.LecOpenListVO;

@Mapper
public interface LectureOpenDAOP extends AbstractCommonMapper<LecOpenListVO, String>{
	public LecOpenListVO selectRecord(String memNo);
	
	// 신청 CRUD
	public List<LecOpenListVO> selectLectureApplList(String memNo);
	public LecOpenListVO selectLectureAppl(String lolAppno);
	public int lectureApplInserst(LecOpenListVO vo);
	public int lectureApplUpdate(LecOpenListVO vo);
	public int lectureApplDelete(String lolAppno);
	
	// 승인
	public List<LecOpenListVO> selectLectureDecisionList(String deptCode);
	public int lectureDecisionUpdate(LecOpenListVO vo);
	
	// 강의계획서 조회
	public LecOpenListVO selectLecturePlan(String lpCode);
	
	// 그 외
	public String selectLolAppNo();
	public int updateLolAppNo(LecOpenListVO vo);
}
