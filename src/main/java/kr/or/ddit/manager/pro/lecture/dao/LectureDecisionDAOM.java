package kr.or.ddit.manager.pro.lecture.dao;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;

import kr.or.ddit.vo.cyber.LecOpenListVO;
import kr.or.ddit.vo.cyber.LecturePlanVO;
import kr.or.ddit.vo.cyber.LectureTimeVO;
import kr.or.ddit.vo.cyber.LectureVO;

@Mapper
public interface LectureDecisionDAOM {
	public LecOpenListVO selectLectureAppl(String lolAppno);
	public List<LecOpenListVO> selectLectureDecisionList();
	public int lectureDecisionUpdate(LecOpenListVO vo);
	public int insertLolAppno(LecOpenListVO vo);
	public int insertNewLecture(LectureVO vo);
	public int updateLecturePlan(LecturePlanVO vo);
	public int insertLectureTime(LectureTimeVO vo);
}
