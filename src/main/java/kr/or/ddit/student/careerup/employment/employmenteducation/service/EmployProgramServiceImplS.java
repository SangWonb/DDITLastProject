package kr.or.ddit.student.careerup.employment.employmenteducation.service;

import java.util.List;

import javax.inject.Inject;

import org.springframework.stereotype.Service;

import kr.or.ddit.enumpkg.ServiceResult;
import kr.or.ddit.student.careerup.employment.employmenteducation.dao.EmployProgramDAOS;
import kr.or.ddit.utils.exception.PKNotFoundException;
import kr.or.ddit.utils.paging.PaginationInfo;
import kr.or.ddit.vo.careerup.ApplVO;
import kr.or.ddit.vo.careerup.EmployProgramVO;

@Service
public class EmployProgramServiceImplS implements EmployProgramServiceS {
	
	@Inject
	EmployProgramDAOS dao;

	@Override
	public List<EmployProgramVO> retrieveEmployProgramList(PaginationInfo paging) {
		int totalRecord = dao.selectTotalRecord(paging);
		paging.setTotalRecord(totalRecord);
		return dao.selectList(paging);
	}

	@Override
	public EmployProgramVO retrieveEmployProgram(String emppgCode) {
		EmployProgramVO program = dao.select(emppgCode);
		if(program == null) {
			throw new PKNotFoundException(emppgCode+"프로그램이 존재하지 않음");
		}
		return program;
	}

	@Override
	public ServiceResult createAppl(ApplVO appl) {
		ServiceResult result = null;
		result = dao.insertAppl(appl) > 0 ? ServiceResult.OK : ServiceResult.FAIL;
		return result;
	}

	@Override
	public List<ApplVO> retrieveApplList(String memNo) {
		return dao.selectApplList(memNo);
	}

	@Override
	public ApplVO retrieveAppl(String appl) {
		ApplVO applRe = dao.selectAppl(appl);
		if(applRe == null) {
			throw new PKNotFoundException(appl+"신청내역이 존재하지 않음");
		}
		return applRe;
	}

	@Override
	public ServiceResult removeAppl(String appl) {
		ServiceResult result = null;
		result = dao.deleteAppl(appl) > 0 ? ServiceResult.OK : ServiceResult.FAIL;
		return result;
	}

	@Override
	public ApplVO retrieveRecord(String appl) {
		ApplVO record = dao.selectRecord(appl);
		return record;
	}

	@Override
	public List<EmployProgramVO> retrieveEmployProgramListForPo() {
		return dao.ForPo();
	}
}