package kr.or.ddit.professor.info.counsel.counselappl.service;

import java.util.List;

import javax.inject.Inject;

import org.springframework.stereotype.Service;

import kr.or.ddit.enumpkg.ServiceResult;
import kr.or.ddit.professor.info.counsel.counselappl.dao.CounselAppPDAO;
import kr.or.ddit.vo.info.CounselVO;

@Service
public class CounselAppPServiceImpl implements CounselAppPService{

	@Inject
	private CounselAppPDAO dao;
	

	@Override
	public ServiceResult modCounsel(CounselVO counsel) {
		String memNo=counsel.getMemNo();
		
		String counsNo=dao.selectCounsNo(memNo);
		
		counsel.setCounsNo(counsNo);
		
		return dao.update(counsel)>0?ServiceResult.OK :ServiceResult.FAIL;
	}

	@Override
	public int retrievetWaitingCount(String pmemNo) {
		return dao.selectWaitingCount(pmemNo);
	}

	@Override
	public List<CounselVO> retrieveList(String pmemNo) {
		return dao.selectCounselList(pmemNo);
	}

	@Override
	public CounselVO retrieveDetail(String pmemNo) {
		return dao.select(pmemNo);
	}

}
