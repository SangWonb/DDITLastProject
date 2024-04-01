package kr.or.ddit.manager.com.board.complaint.service;

import java.util.List;

import kr.or.ddit.enumpkg.ServiceResult;
import kr.or.ddit.utils.paging.PaginationInfo;
import kr.or.ddit.vo.cyber.ComplaintVO;

public interface ComplaintServiceM {
	
	public ServiceResult createComplain(ComplaintVO complain);
	
	public List<ComplaintVO> retrieveComplainList(PaginationInfo paging);
	
	public ComplaintVO retrieveComplain(String cptNo);
	
	public ServiceResult modifyComplaink(ComplaintVO complain); 
	
	public ServiceResult removeComplain(ComplaintVO delData);
}
