package kr.or.ddit.manager.pro.subject.service;

import java.util.List;

import kr.or.ddit.enumpkg.ServiceResult;
import kr.or.ddit.vo.cyber.SubjectVO;

public interface SubjectDecisionServiceM {
	
	public SubjectVO retrieveRecord(String subCode);

	public List<SubjectVO> retrieveSubjectDecisionList();
	
	public SubjectVO retrieveSubjectAppl(String subAppno);
	public SubjectVO retrieveSubjectDecision(String subCode);
	
	public ServiceResult modifySubjectDecision(SubjectVO subejct);
}
