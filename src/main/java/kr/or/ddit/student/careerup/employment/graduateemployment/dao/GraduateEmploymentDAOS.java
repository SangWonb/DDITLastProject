package kr.or.ddit.student.careerup.employment.graduateemployment.dao;

import org.apache.ibatis.annotations.Mapper;

import kr.or.ddit.utils.abMapper.AbstractCommonMapper;
import kr.or.ddit.vo.careerup.SeniorCoworkerVO;

@Mapper
public interface GraduateEmploymentDAOS extends AbstractCommonMapper<SeniorCoworkerVO, String>{
}
