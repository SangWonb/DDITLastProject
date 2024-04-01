package kr.or.ddit.manager.com.board.academicnotice.dao;

import org.apache.ibatis.annotations.Mapper;

import kr.or.ddit.utils.abMapper.AbstractCommonMapper;
import kr.or.ddit.vo.common.CommunityVO;

@Mapper
public interface AcademicNoticeDAOM extends AbstractCommonMapper<CommunityVO, String>{

}
