package kr.or.ddit.common.board.clubboard.service;

import java.util.List;

import kr.or.ddit.enumpkg.ServiceResult;
import kr.or.ddit.utils.paging.PaginationInfo;
import kr.or.ddit.vo.common.ClubRecomVO;
import kr.or.ddit.vo.common.ClubVO;

public interface ClubBoardService {
	
	/**
	 * @param newRecom(mbti,sex,xub) => 1순위, 2순위, 3순위 
	 * @return 
	 */
	public List<ClubVO> retrieveClubRecom(ClubRecomVO newRecom);
	public List<ClubVO> retrieceClubList(PaginationInfo paging);
	public ClubVO retrieveClub(String clubNo);
	public ServiceResult createClub(ClubVO newClub);
	public ServiceResult modifyClub(ClubVO modClub);
	public ServiceResult removeClub(String clubNo);
	public ServiceResult modifyClubViews();
	
}
