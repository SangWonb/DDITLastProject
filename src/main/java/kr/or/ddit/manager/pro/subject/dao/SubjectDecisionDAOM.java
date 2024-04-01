package kr.or.ddit.manager.pro.subject.dao;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;

import kr.or.ddit.vo.cyber.SubjectVO;

@Mapper
public interface SubjectDecisionDAOM {
	// 갯수 조회
	public SubjectVO selectRecord(String subCode);
	// 여러건 조회
	public List<SubjectVO> selectSubjectDecisionList();
	// 단건 조회
	public SubjectVO selectSubjectAppl(String subAppno);
	public SubjectVO selectSubjectDecision(String subCode);
	// 승인/반려 결정
	public int subjectDecisionUpdate(SubjectVO vo);
	// subCode 생성
	public int insertSubCode(SubjectVO vo);
}
