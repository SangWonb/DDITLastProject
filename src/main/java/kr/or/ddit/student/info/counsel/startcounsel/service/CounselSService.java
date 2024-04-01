package kr.or.ddit.student.info.counsel.startcounsel.service;

import java.util.List;

import kr.or.ddit.vo.info.CounselVO;

public interface CounselSService {

	public List<CounselVO> retrieveCounselList(String memNo);
	public CounselVO retrieveCounsel(String counsNo);
	public int retrieveTotal(String memNo);
	public int retrieveWaiting(String memNo);
}
