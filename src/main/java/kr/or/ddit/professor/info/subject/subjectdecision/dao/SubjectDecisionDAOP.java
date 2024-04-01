package kr.or.ddit.professor.info.subject.subjectdecision.dao;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;

import kr.or.ddit.vo.cyber.SubjectVO;

@Mapper
public interface SubjectDecisionDAOP {
	
	public SubjectVO selectRecord(String subCode);
	
	public List<SubjectVO> selectSubjectDecisionList(String memNo);
	public SubjectVO selectSubjectDecision(String subCode);
	
	public int subjectDecisionUpdate(SubjectVO vo);
}
