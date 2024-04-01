package kr.or.ddit.student.careerup.employment.employmentagency.dao;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;

import kr.or.ddit.utils.abMapper.AbstractCommonMapper;
import kr.or.ddit.vo.careerup.EmploymentPlaceVO;

@Mapper
public interface EmploymentAgencyDAOS extends AbstractCommonMapper<EmploymentPlaceVO, String> {
	public List<EmploymentPlaceVO> selectListForPo();
}
