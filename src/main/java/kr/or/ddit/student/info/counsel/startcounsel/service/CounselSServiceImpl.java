package kr.or.ddit.student.info.counsel.startcounsel.service;

import java.util.List;

import javax.inject.Inject;

import org.springframework.stereotype.Service;

import kr.or.ddit.student.info.counsel.startcounsel.dao.CounselSDAO;
import kr.or.ddit.vo.info.CounselVO;

@Service
public class CounselSServiceImpl implements CounselSService{

	@Inject
	private CounselSDAO dao;
	
	@Override
	public List<CounselVO> retrieveCounselList(String memNo) {
		return dao.selectCounselList(memNo);
	}

	@Override
	public CounselVO retrieveCounsel(String counsNo) {
		return dao.selectCounsel(counsNo);
	}

	@Override
	public int retrieveTotal(String memNo) {
		return dao.selectTotal(memNo);
	}

	@Override
	public int retrieveWaiting(String memNo) {
		return dao.selectWaiting(memNo);
	}

}
