package kr.or.ddit.manager.pro.subject.service;

import java.util.List;

import javax.inject.Inject;

import org.springframework.stereotype.Service;

import kr.or.ddit.enumpkg.ServiceResult;
import kr.or.ddit.manager.pro.subject.dao.SubjectDecisionDAOM;
import kr.or.ddit.utils.exception.PKNotFoundException;
import kr.or.ddit.vo.cyber.SubjectVO;
import lombok.extern.slf4j.Slf4j;

@Slf4j
@Service
public class SubjectDecisionServiceImplM implements SubjectDecisionServiceM {
	
	@Inject
	SubjectDecisionDAOM dao;
	
	@Override
	public List<SubjectVO> retrieveSubjectDecisionList() {
		return dao.selectSubjectDecisionList();
	}

	@Override
	public SubjectVO retrieveRecord(String subCode) {
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
		String statusCode = subejct.getStatusCode();
		log.info("\n\n\n{}\n\n\n",statusCode);
		if(statusCode.equals("STA06")) {
			dao.insertSubCode(subejct);
			result = ServiceResult.OK;
		} else {
			result = ServiceResult.FAIL;
		}
		return result;
	}
	
	@Override
	public SubjectVO retrieveSubjectDecision(String subCode) {
		SubjectVO record = dao.selectRecord(subCode);
		return record;
	}

	@Override
	public SubjectVO retrieveSubjectAppl(String subAppno) {
		SubjectVO appl = dao.selectSubjectAppl(subAppno);
		if(appl == null) {
			throw new PKNotFoundException(subAppno+"신청내역이 존재하지 않음");
		}
		return appl;
	}
}