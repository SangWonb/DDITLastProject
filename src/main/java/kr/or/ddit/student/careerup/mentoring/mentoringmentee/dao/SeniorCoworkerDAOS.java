package kr.or.ddit.student.careerup.mentoring.mentoringmentee.dao;

import org.apache.ibatis.annotations.Mapper;

import kr.or.ddit.utils.abMapper.AbstractCommonMapper;
import kr.or.ddit.vo.careerup.SeniorCoworkerVO;

@Mapper
public interface SeniorCoworkerDAOS extends AbstractCommonMapper<SeniorCoworkerVO, String> {
}
