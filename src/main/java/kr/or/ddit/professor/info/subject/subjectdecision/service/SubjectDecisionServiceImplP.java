package kr.or.ddit.professor.info.subject.subjectdecision.service;

import java.util.List;

import javax.inject.Inject;

import org.springframework.stereotype.Service;

import kr.or.ddit.enumpkg.ServiceResult;
import kr.or.ddit.professor.info.subject.subjectdecision.dao.SubjectDecisionDAOP;
import kr.or.ddit.utils.exception.PKNotFoundException;
import kr.or.ddit.vo.cyber.SubjectVO;

@Service
public class SubjectDecisionServiceImplP implements SubjectDecisionServiceP {
	
	@Inject
	SubjectDecisionDAOP dao;

	@Override
	public List<SubjectVO> retrieveSubjectDecisionList(String memNo) {
		return dao.selectSubjectDecisionList(memNo);
	}

	@Override
	public SubjectVO retrieveSubjectDecision(String subCode) {
		SubjectVO appl = dao.selectSubjectDecision(subCode);
		if(appl == null) {
			throw new PKNotFoundException(subCode+"신청내역이 존재하지 않음");
		}
		return appl;
	}

	@Override
	public ServiceResult modifySubjectDecision(SubjectVO subejct) {
		ServiceResult result = null;
		result = dao.subjectDecisionUpdate(subejct) > 0 ? ServiceResult.OK : ServiceResult.FAIL;
		return result;
	}

	@Override
	public SubjectVO retrieveRecord(String subCode) {
		SubjectVO record = dao.selectRecord(subCode);
		return record;
	}
}