package kr.or.ddit.student.careerup.subjectrecom.dao;

import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Param;

import kr.or.ddit.utils.abMapper.AbstractCommonMapper;
import kr.or.ddit.vo.careerup.SeniorCoworkerVO;
import kr.or.ddit.vo.careerup.SubjectRecomVO;
import kr.or.ddit.vo.cyber.SubjectVO;

@Mapper
public interface SubjectRecomDAOS extends AbstractCommonMapper<SeniorCoworkerVO, String> {

	public SubjectRecomVO recom(SubjectRecomVO condition);
}
