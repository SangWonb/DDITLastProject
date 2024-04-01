package kr.or.ddit.common.board.freeboard.dao;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Param;

import kr.or.ddit.utils.abMapper.AbstractCommonMapper;
import kr.or.ddit.utils.paging.PaginationInfo;
import kr.or.ddit.vo.common.CommunityVO;
import kr.or.ddit.vo.cyber.LectureAnnouncementVO;
import kr.or.ddit.vo.cyber.LectureDataVO;

@Mapper
public interface FreeBoardDAO extends AbstractCommonMapper<CommunityVO, String> {
	public int selectTotalRecord(@Param("paging")PaginationInfo paging);
	public int insertComment(CommunityVO newCm);
	public List<CommunityVO> selectListComment();
	public int updateCount(String cmntCode);
	public List<CommunityVO> selectListCustom(@Param("paging")PaginationInfo paging,@Param("cmntCode") String cmntCode);
	public int insertFB(CommunityVO newCm);
	public int updateCommunity(CommunityVO vo);
	public int deleteCommunity(String cmntCode);
}
