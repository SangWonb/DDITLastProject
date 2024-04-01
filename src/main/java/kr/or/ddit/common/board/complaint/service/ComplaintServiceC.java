package kr.or.ddit.common.board.complaint.service;

import java.util.List;

import kr.or.ddit.enumpkg.ServiceResult;
import kr.or.ddit.utils.paging.PaginationInfo;
import kr.or.ddit.vo.common.CommunityVO;
import kr.or.ddit.vo.cyber.ComplaintVO;

public interface ComplaintServiceC {

	public List<CommunityVO> selectList(PaginationInfo paging);
	
	public ServiceResult createComplaint(CommunityVO com);
	
	public CommunityVO retrieveOne(String cmntCode);
	
	public ServiceResult removeComplaint(String cmntCode);
	
	public ServiceResult modifyComplaint(CommunityVO com);
	
	public int countBoard();
}
