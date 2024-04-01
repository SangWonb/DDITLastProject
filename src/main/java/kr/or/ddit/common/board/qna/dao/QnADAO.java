package kr.or.ddit.common.board.qna.dao;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Param;
import org.springframework.stereotype.Repository;

import kr.or.ddit.enumpkg.ServiceResult;
import kr.or.ddit.utils.abMapper.AbstractCommonMapper;
import kr.or.ddit.utils.paging.PaginationInfo;
import kr.or.ddit.vo.common.CommunityVO;

@Mapper
public interface QnADAO extends AbstractCommonMapper<CommunityVO, String>{

	public int selectTotalRecord(@Param("paging")PaginationInfo paging);
	public int insertComment(CommunityVO newCm);
	public List<CommunityVO> selectListComment();
	public int updateCount(String cmntCode);
	public List<CommunityVO> selectListCustom(@Param("paging")PaginationInfo paging,@Param("cmntCode") String cmntCode);
	public int insertQA(CommunityVO newCm);
	public int updateCommunity(CommunityVO vo);
	public int deleteCommunity(String cmntCode);
	
}
