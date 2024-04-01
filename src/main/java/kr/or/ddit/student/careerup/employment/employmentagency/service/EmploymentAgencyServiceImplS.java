package kr.or.ddit.student.careerup.employment.employmentagency.service;

import java.util.List;

import javax.inject.Inject;

import org.springframework.stereotype.Service;

import kr.or.ddit.student.careerup.employment.employmentagency.dao.EmploymentAgencyDAOS;
import kr.or.ddit.utils.paging.PaginationInfo;
import kr.or.ddit.vo.careerup.EmploymentPlaceVO;

@Service
public class EmploymentAgencyServiceImplS implements EmploymentAgencyServiceS {

	@Inject
	EmploymentAgencyDAOS dao;
	
	@Override
	public List<EmploymentPlaceVO> retrieveEmploymentAgencyList(PaginationInfo paging) {
		int totalRecord = dao.selectTotalRecord(paging);
		paging.setTotalRecord(totalRecord);
		return dao.selectList(paging);
	}

	@Override
	public List<EmploymentPlaceVO> retrieveEmploymentAgencyListForPo() {
		return dao.selectListForPo();
	}
}