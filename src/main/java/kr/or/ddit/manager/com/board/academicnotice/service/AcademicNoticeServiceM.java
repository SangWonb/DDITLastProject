package kr.or.ddit.manager.com.board.academicnotice.service;

import java.util.List;

import kr.or.ddit.enumpkg.ServiceResult;
import kr.or.ddit.utils.paging.PaginationInfo;
import kr.or.ddit.vo.common.CommunityVO;

public interface AcademicNoticeServiceM {
	
	public CommunityVO retrieveAcademicNotice(String cmntCode);

	public List<CommunityVO> retrieveAcademicNoticeList(PaginationInfo paging);
	
	public ServiceResult modifyAcademicNotice(CommunityVO notice);
	
	public ServiceResult createAcademicNotice(CommunityVO notice);
	
	public ServiceResult removeAcademicNotice(String cmntCode);
}
