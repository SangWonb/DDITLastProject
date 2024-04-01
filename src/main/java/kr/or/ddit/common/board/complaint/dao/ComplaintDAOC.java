package kr.or.ddit.common.board.complaint.dao;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Param;

import kr.or.ddit.enumpkg.ServiceResult;
import kr.or.ddit.utils.abMapper.AbstractCommonMapper;
import kr.or.ddit.utils.abMapper.AbstractCommonMapper2;
import kr.or.ddit.utils.paging.PaginationInfo;
import kr.or.ddit.vo.common.CommunityVO;
import kr.or.ddit.vo.cyber.ComplaintVO;

@Mapper
public interface ComplaintDAOC extends AbstractCommonMapper<CommunityVO, String>{
	public int selectTotalRecord(@Param("paging")PaginationInfo paging);
	public ServiceResult condition(String cmntCode);
	public int insertCP(CommunityVO newCm);
	public List<CommunityVO> selectListCustom(@Param("paging")PaginationInfo paging,@Param("cmntCode") String cmntCode);
	public int updateCommunity(CommunityVO vo);
	public int deleteCommunity(String cmntCode);
	public int updateCount(String cmntCode);
}
