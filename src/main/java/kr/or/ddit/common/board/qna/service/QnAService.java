package kr.or.ddit.common.board.qna.service;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;

import kr.or.ddit.enumpkg.ServiceResult;
import kr.or.ddit.utils.paging.PaginationInfo;
import kr.or.ddit.vo.common.CommunityVO;

public interface QnAService {

	public List<CommunityVO> retrieveQAList(PaginationInfo paging);
	public CommunityVO retrieveQA(String cmntCode);
	public ServiceResult createQA(CommunityVO newFb);
	public ServiceResult modifyQA(CommunityVO modFb);
	public ServiceResult removeQA(String cmntCode);
	public ServiceResult createCm(CommunityVO newCm);
	public int countBoard();
}
