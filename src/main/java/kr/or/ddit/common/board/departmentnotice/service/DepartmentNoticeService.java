package kr.or.ddit.common.board.departmentnotice.service;

import java.util.List;
import java.util.Map;

import kr.or.ddit.utils.paging.PaginationInfo;
import kr.or.ddit.vo.common.CommunityVO;

public interface DepartmentNoticeService {
	
	public CommunityVO retrieveDepartmentNotice(String cmntCode);

//	public List<CommunityVO> retrieveDepartmentNoticeList(Map<String, Object> paramMap);
	public List<CommunityVO> retrieveDepartmentNoticeList(PaginationInfo paging, String deptCode);
	
}
