package kr.or.ddit.common.board.clubboard.service;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.inject.Inject;

import org.springframework.stereotype.Service;

import kr.or.ddit.common.board.clubboard.dao.ClubBoardDAO;
import kr.or.ddit.enumpkg.ServiceResult;
import kr.or.ddit.utils.paging.PaginationInfo;
import kr.or.ddit.vo.common.ClubRecomVO;
import kr.or.ddit.vo.common.ClubVO;

@Service
public class ClubBoardServiceImpl implements ClubBoardService {

	@Inject
	private ClubBoardDAO dao;

	@Override
	public List<ClubVO> retrieveClubRecom(ClubRecomVO newRecom) {
		if(newRecom==null) {
			
		}
		List<ClubVO> recomList = new ArrayList<>();
		
		ClubRecomVO recom = dao.selectClubRecom(newRecom);
		
		ClubVO first=dao.select(recom.first);
		ClubVO second=dao.select(recom.second);
		ClubVO third=dao.select(recom.third);

		recomList.add(first);
		recomList.add(second);
		recomList.add(third);
		
		return recomList;
	}

	@Override
	public ServiceResult createClub(ClubVO newClub) {
		return dao.insert(newClub)>0?ServiceResult.OK : ServiceResult.FAIL;
	}

	@Override
	public ServiceResult modifyClub(ClubVO modClub) {
		if(modClub.getStatus().containsValue("STA06")) {
			String clubNo=dao.selectClubNo();
			modClub.setClubNo(clubNo);
		}
		return dao.update(modClub)>0?ServiceResult.OK : ServiceResult.FAIL;
	}

	@Override
	public ClubVO retrieveClub(String clubNo) {
		ClubVO clubInfo = dao.select(clubNo);
		return clubInfo;
	}

	@Override
	public ServiceResult removeClub(String clubNo) {
		return dao.delete(clubNo)>0?ServiceResult.OK : ServiceResult.FAIL;
	}

	@Override
	public List<ClubVO> retrieceClubList(PaginationInfo paging) {
		int totalRecord = dao.selectTotalRecord(paging);
		paging.setTotalRecord(totalRecord);
		return dao.selectList(paging);
	}

	@Override
	public ServiceResult modifyClubViews() {
		// TODO Auto-generated method stub
		return null;
	}
	
	

}
