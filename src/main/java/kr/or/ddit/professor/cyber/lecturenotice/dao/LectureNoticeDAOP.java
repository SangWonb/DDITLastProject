package kr.or.ddit.professor.cyber.lecturenotice.dao;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Param;

import kr.or.ddit.utils.abMapper.AbstractCommonMapper;
import kr.or.ddit.utils.paging.PaginationInfo;
import kr.or.ddit.vo.cyber.LectureAnnouncementVO;

@Mapper
public interface LectureNoticeDAOP extends AbstractCommonMapper<LectureAnnouncementVO, String>{

	
	public List<LectureAnnouncementVO> selectListAnnoun(@Param("paging") PaginationInfo paging,@Param("lecCode") String lecCode,@Param("memName")String memName);
	public int insertNotice(LectureAnnouncementVO notice);
	
	
}
