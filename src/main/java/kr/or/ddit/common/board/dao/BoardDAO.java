package kr.or.ddit.common.board.dao;

import org.apache.ibatis.annotations.Mapper;

import kr.or.ddit.utils.abMapper.AbstractCommonMapper;
import kr.or.ddit.vo.common.CommunityVO;

@Mapper
public interface BoardDAO extends AbstractCommonMapper<CommunityVO, Integer>{

}
