package kr.or.ddit.student.careerup.employment.employmentreview.service;

import java.util.List;

import kr.or.ddit.utils.paging.PaginationInfo;
import kr.or.ddit.vo.careerup.EmploymentReviewVO;

public interface EmploymentReviewServiceS {
	
	public List<EmploymentReviewVO> retrieveEmployReviewList(PaginationInfo paging);
	
	public EmploymentReviewVO retrieveEmployReview(String empNo);

}
