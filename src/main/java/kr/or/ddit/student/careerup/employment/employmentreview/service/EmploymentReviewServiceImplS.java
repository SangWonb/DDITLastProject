package kr.or.ddit.student.careerup.employment.employmentreview.service;

import java.util.List;

import javax.inject.Inject;

import org.springframework.stereotype.Service;

import kr.or.ddit.student.careerup.employment.employmentreview.dao.EmploymentReviewDAOS;
import kr.or.ddit.utils.exception.PKNotFoundException;
import kr.or.ddit.utils.paging.PaginationInfo;
import kr.or.ddit.vo.careerup.EmploymentReviewVO;

@Service
public class EmploymentReviewServiceImplS implements EmploymentReviewServiceS {
	
	@Inject
	EmploymentReviewDAOS dao;

	@Override
	public List<EmploymentReviewVO> retrieveEmployReviewList(PaginationInfo paging) {
		int totalRecord = dao.selectTotalRecord(paging);
		paging.setTotalRecord(totalRecord);
		return dao.selectList(paging);
	}

	@Override
	public EmploymentReviewVO retrieveEmployReview(String empNo) {
		EmploymentReviewVO employmentReview = dao.select(empNo);
		if(employmentReview == null) {
			throw new PKNotFoundException(empNo+"취업후기가 존재하지 않음");
		}
		return employmentReview;
	}
}