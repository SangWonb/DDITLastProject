package kr.or.ddit.professor.info.counsel.startcounsel.service;

import java.util.List;

import javax.inject.Inject;

import org.springframework.stereotype.Service;

import kr.or.ddit.enumpkg.ServiceResult;
import kr.or.ddit.professor.info.counsel.startcounsel.dao.CounselPDAO;
import kr.or.ddit.vo.info.CounselVO;
import kr.or.ddit.vo.user.StudentVO;

@Service
public class CounselPServiceImpl implements CounselPService{

	@Inject
	private CounselPDAO dao;
	
	@Override
	public List<CounselVO> retrieveCounselList(String pmemNo) {
		return dao.selectCounsList(pmemNo);
	}

	@Override
	public ServiceResult modCounselDetail(String counsNo) {
		return dao.updateCounsel(counsNo)>0? ServiceResult.OK : ServiceResult.FAIL;
	}

	@Override
	public StudentVO retrieveStudent(String memNo) {
		return dao.selectStudent(memNo);
	}

	@Override
	public ServiceResult modCounselJournal(CounselVO content) {
		return dao.update(content)>0? ServiceResult.OK : ServiceResult.FAIL;
	}

	@Override
	public CounselVO retrieveCount(CounselVO couns) {
		return dao.selectCount(couns);
	}

}
