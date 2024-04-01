package kr.or.ddit.professor.info.subject.subjectdecision.service;

import java.util.List;

import kr.or.ddit.enumpkg.ServiceResult;
import kr.or.ddit.vo.cyber.SubjectVO;

public interface SubjectDecisionServiceP {
	
	public SubjectVO retrieveRecord(String subCode);

	public List<SubjectVO> retrieveSubjectDecisionList(String memNo);
	public SubjectVO retrieveSubjectDecision(String subCode);
	
	public ServiceResult modifySubjectDecision(SubjectVO subejct);

}
