package kr.or.ddit.professor.info.subject.subjectappl.dao;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;

import kr.or.ddit.utils.abMapper.AbstractCommonMapper;
import kr.or.ddit.vo.cyber.SubjectVO;

@Mapper
public interface SubjectApplDAOP extends AbstractCommonMapper<SubjectVO, String>{
	
	// 교과목 개설 신청(교수)
	public SubjectVO selectRecord(String memNo);
	public List<SubjectVO> selectSubjectApplList(String memNo);
	public SubjectVO selectSubjectAppl(String subAppno);
	public int subjectApplInserst(SubjectVO vo);
	public int subjectApplUpdate(SubjectVO vo);
	public int subjectApplDelete(String subAppno);
	
	// 교과목 개설 승인(학과장 교수)
	public List<SubjectVO> selectSubjectDecisionList(String deptCode);
	public int subjectDecisionUpdate(SubjectVO vo);
	public String selectSubAppNo();
	public int updateSubjectNo(SubjectVO vo);
	
}
