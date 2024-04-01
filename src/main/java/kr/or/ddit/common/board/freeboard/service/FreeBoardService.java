package kr.or.ddit.common.board.freeboard.service;

import java.util.List;

import kr.or.ddit.enumpkg.ServiceResult;
import kr.or.ddit.utils.paging.PaginationInfo;
import kr.or.ddit.vo.common.CommunityVO;

public interface FreeBoardService {
	
	public List<CommunityVO> retrieveFbList(PaginationInfo paging);
	public CommunityVO retrieveFb(String cmntCode);
	public ServiceResult createFb(CommunityVO newFb);
	public ServiceResult modifyFb(CommunityVO modFb);
	public ServiceResult removeFb(String cmntCode);
	public ServiceResult createCm(CommunityVO newCm);
	public int countBoard();
	
	

}
