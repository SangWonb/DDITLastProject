package kr.or.ddit.professor.info.counsel.counselappl.service;

import java.util.List;

import kr.or.ddit.enumpkg.ServiceResult;
import kr.or.ddit.vo.info.CounselVO;

public interface CounselAppPService {
	
	public int retrievetWaitingCount(String pmemNo);
	public List<CounselVO> retrieveList(String pmemNo);
	public CounselVO retrieveDetail(String pmemNo);
	public ServiceResult modCounsel(CounselVO counsel);
}
