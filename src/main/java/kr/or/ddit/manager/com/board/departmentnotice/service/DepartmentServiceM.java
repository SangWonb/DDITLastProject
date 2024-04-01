package kr.or.ddit.manager.com.board.departmentnotice.service;

import java.util.List;

import kr.or.ddit.enumpkg.ServiceResult;
import kr.or.ddit.utils.paging.PaginationInfo;
import kr.or.ddit.vo.common.CommunityVO;

public interface DepartmentServiceM {
	
	public CommunityVO retrieveDepartmentNotice(String cmntCode);

	public List<CommunityVO> retrieveDepartmentNoticeList(PaginationInfo paging);
	
	public ServiceResult modifyDepartmentNotice(CommunityVO notice);
	
	public ServiceResult createDepartmentNotice(CommunityVO notice);
	
	public ServiceResult removeDepartmentNotice(String cmntCode);
}
