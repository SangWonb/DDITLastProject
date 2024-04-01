package kr.or.ddit.student.careerup.employment.employmenteducation.dao;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;

import kr.or.ddit.utils.abMapper.AbstractCommonMapper;
import kr.or.ddit.vo.careerup.ApplVO;
import kr.or.ddit.vo.careerup.EmployProgramVO;

@Mapper
public interface EmployProgramDAOS extends AbstractCommonMapper<EmployProgramVO, String>{
	public List<EmployProgramVO> ForPo();
	public int insertAppl(ApplVO appl);
	public List<ApplVO> selectApplList(String memNo);
	public ApplVO selectAppl(String appl);
	public int deleteAppl(String appl);
	public ApplVO selectRecord(String appl);
}