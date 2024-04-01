package kr.or.ddit.professor.info.subject.subjectappl.service;

import java.util.List;

import kr.or.ddit.enumpkg.ServiceResult;
import kr.or.ddit.vo.cyber.SubjectVO;

public interface SubjectApplServiceP {
	
	public SubjectVO retrieveRecord(String menteeNo);

	public List<SubjectVO> retrieveSubjectApplList(String memNo);
	public SubjectVO retrieveSubjectAppl(String subAppno);
	
	public ServiceResult subjectApplInserst(SubjectVO subejct);
	public ServiceResult modifySubjectAppl(SubjectVO subejct);
	public ServiceResult removeSubjectAppl(String subAppno);
	
	public List<SubjectVO> retrieveSubjectDecisionList(String deptCode);
	public ServiceResult modifySubjectDecision(SubjectVO subejct);

	public ServiceResult modifySubCode(SubjectVO subejct);
}
