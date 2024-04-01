package kr.or.ddit.manager.stu.criteria.graduationcriteria.dao;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;

import kr.or.ddit.utils.abMapper.AbstractCommonMapper;
import kr.or.ddit.vo.info.EnglishVO;

@Mapper
public interface EnglishDAO extends AbstractCommonMapper<EnglishVO, String>{
	public List<EnglishVO> selectBoxEng();
}
