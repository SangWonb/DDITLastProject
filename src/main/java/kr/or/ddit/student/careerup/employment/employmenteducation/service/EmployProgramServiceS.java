package kr.or.ddit.student.careerup.employment.employmenteducation.service;

import java.util.List;

import kr.or.ddit.enumpkg.ServiceResult;
import kr.or.ddit.utils.paging.PaginationInfo;
import kr.or.ddit.vo.careerup.ApplVO;
import kr.or.ddit.vo.careerup.EmployProgramVO;

public interface EmployProgramServiceS {
	// 프로그램 목록
	public List<EmployProgramVO> retrieveEmployProgramList(PaginationInfo paging);
	public List<EmployProgramVO> retrieveEmployProgramListForPo();
	public EmployProgramVO retrieveEmployProgram(String emppgCode);
	
	// 신청
	public ServiceResult createAppl(ApplVO appl);
	public List<ApplVO> retrieveApplList(String memNo);
	public ApplVO retrieveAppl(String appl);
	public ServiceResult removeAppl(String appl);
	
	public ApplVO retrieveRecord(String appl);
}
