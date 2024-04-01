package kr.or.ddit.common.board.academicnotice.service;

import java.util.List;

import kr.or.ddit.utils.paging.PaginationInfo;
import kr.or.ddit.vo.common.CommunityVO;

public interface AcademicNoticeService {
	
	public CommunityVO retrieveAcademicNotice(String cmntCode);

	public List<CommunityVO> retrieveAcademicNoticeList(PaginationInfo paging);
}
