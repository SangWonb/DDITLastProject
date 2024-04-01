package kr.or.ddit.student.cyber.onlinelecture.dao;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Param;

import kr.or.ddit.utils.abMapper.AbstractCommonMapper;
import kr.or.ddit.utils.paging.PaginationInfo;
import kr.or.ddit.vo.cyber.AttendVO;
import kr.or.ddit.vo.cyber.LectureAnnouncementVO;
import kr.or.ddit.vo.cyber.LectureOnlineVO;
import kr.or.ddit.vo.cyber.LectureVO;
import kr.or.ddit.vo.whole.FileVO;

@Mapper
public interface OnlineLectureDAOS extends AbstractCommonMapper<LectureOnlineVO, String>{

	public List<LectureOnlineVO> selectListLecture(@Param("paging") PaginationInfo paging,@Param("memName")String memName,@Param("lecCode") String lecCode);
	public int insertAttend(AttendVO lec);
	public int updateFile(LectureOnlineVO lec);
}
