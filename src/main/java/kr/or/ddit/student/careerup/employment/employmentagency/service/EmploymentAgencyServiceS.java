package kr.or.ddit.student.careerup.employment.employmentagency.service;

import java.util.List;

import kr.or.ddit.utils.paging.PaginationInfo;
import kr.or.ddit.vo.careerup.EmploymentPlaceVO;

public interface EmploymentAgencyServiceS {
	public List<EmploymentPlaceVO> retrieveEmploymentAgencyList(PaginationInfo paging);
	public List<EmploymentPlaceVO> retrieveEmploymentAgencyListForPo();
}
