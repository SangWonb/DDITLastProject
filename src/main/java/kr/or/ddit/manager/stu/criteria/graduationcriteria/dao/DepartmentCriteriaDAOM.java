package kr.or.ddit.manager.stu.criteria.graduationcriteria.dao;

import org.apache.ibatis.annotations.Mapper;

import kr.or.ddit.utils.abMapper.AbstractCommonMapper;
import kr.or.ddit.vo.cyber.DepartmentVO;

@Mapper
public interface DepartmentCriteriaDAOM extends AbstractCommonMapper<DepartmentVO, String>{

}
