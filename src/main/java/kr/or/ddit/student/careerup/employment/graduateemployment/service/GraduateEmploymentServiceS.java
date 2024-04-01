package kr.or.ddit.student.careerup.employment.graduateemployment.service;

import java.util.List;

import kr.or.ddit.utils.paging.PaginationInfo;
import kr.or.ddit.vo.careerup.SeniorCoworkerVO;

public interface GraduateEmploymentServiceS {
	public List<SeniorCoworkerVO> retrieveGraduateEmploymentList(PaginationInfo paging);
	
	public SeniorCoworkerVO retrieveGraduateEmployment(String srNo);
}
