package kr.or.ddit.common.board.academicnotice.dao;

import org.apache.ibatis.annotations.Mapper;

import kr.or.ddit.utils.abMapper.AbstractCommonMapper;
import kr.or.ddit.vo.common.CommunityVO;

@Mapper
public interface AcademicNoticeDAO extends AbstractCommonMapper<CommunityVO, String>{
	public int updateCount(String cmntcode);
}
