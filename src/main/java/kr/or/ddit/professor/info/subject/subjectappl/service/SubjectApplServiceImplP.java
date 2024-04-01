package kr.or.ddit.professor.info.subject.subjectappl.service;

import java.util.List;

import javax.inject.Inject;

import org.springframework.stereotype.Service;

import kr.or.ddit.enumpkg.ServiceResult;
import kr.or.ddit.professor.info.subject.subjectappl.dao.SubjectApplDAOP;
import kr.or.ddit.utils.exception.PKNotFoundException;
import kr.or.ddit.vo.cyber.SubjectVO;

@Service
public class SubjectApplServiceImplP implements SubjectApplServiceP {
	
	@Inject
	SubjectApplDAOP dao;

	@Override
	public List<SubjectVO> retrieveSubjectApplList(String subAppno) {
		return dao.selectSubjectApplList(subAppno);
	}

	@Override
	public SubjectVO retrieveSubjectAppl(String subAppno) {
		SubjectVO appl = dao.selectSubjectAppl(subAppno);
		if(appl == null) {
			throw new PKNotFoundException(subAppno+"신청내역이 존재하지 않음");
		}
		return appl;
	}

	@Override
	public ServiceResult subjectApplInserst(SubjectVO vo) {
		ServiceResult result = null;
		result = dao.subjectApplInserst(vo) > 0 ? ServiceResult.OK : ServiceResult.FAIL;
		return result;
	}

	@Override
	public ServiceResult modifySubjectAppl(SubjectVO vo) {
		ServiceResult result = null;
		result = dao.subjectApplUpdate(vo) > 0 ? ServiceResult.OK : ServiceResult.FAIL;
		return result;
	}

	@Override
	public ServiceResult removeSubjectAppl(String subAppno) {
		ServiceResult result = null;
		result = dao.subjectApplDelete(subAppno) > 0 ? ServiceResult.OK : ServiceResult.FAIL;
		return result;
	}

	@Override
	public SubjectVO retrieveRecord(String memNo) {
		SubjectVO record = dao.selectRecord(memNo);
		return record;
	}
	
	@Override
	public List<SubjectVO> retrieveSubjectDecisionList(String deptCode) {
		return dao.selectSubjectDecisionList(deptCode);
	}

	@Override
	public ServiceResult modifySubjectDecision(SubjectVO vo) {
		ServiceResult result = null;
		result = dao.subjectDecisionUpdate(vo) > 0 ? ServiceResult.OK : ServiceResult.FAIL;
		return result;
	}

	@Override
	public ServiceResult modifySubCode(SubjectVO vo) {
		if(vo.getStatus().containsValue("STA06")) {
			String subCode=dao.selectSubAppNo();
			vo.setSubCode(subCode);
		}
		return dao.updateSubjectNo(null)>0?ServiceResult.OK : ServiceResult.FAIL;
	}
}