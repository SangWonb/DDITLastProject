package kr.or.ddit.manager.stu.scholarship.service;

import java.util.List;

import kr.or.ddit.enumpkg.ServiceResult;
import kr.or.ddit.utils.paging.PaginationInfo;
import kr.or.ddit.vo.info.ScholashipVO;

public interface ScholarshipServiceM {
	
	public ScholashipVO retrieveScholarshipNotice(String scholCode);

	public List<ScholashipVO> retrieveScholarshipNoticeList(PaginationInfo paging);
	
	public ServiceResult modifyScholarshipNotice(ScholashipVO vo);
	
	public ServiceResult createScholarshipNotice(ScholashipVO vo);
	
	public ServiceResult removeScholarshipNotice(String scholCode);
}
