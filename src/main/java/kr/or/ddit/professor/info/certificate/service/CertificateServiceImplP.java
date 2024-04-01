package kr.or.ddit.professor.info.certificate.service;

import java.util.List;

import javax.inject.Inject;

import org.springframework.stereotype.Service;

import kr.or.ddit.enumpkg.ServiceResult;
import kr.or.ddit.professor.info.certificate.dao.CertificateDAOP;
import kr.or.ddit.vo.info.CertificateGnoPVO;
import kr.or.ddit.vo.info.CertificateGnoVO;
import kr.or.ddit.vo.info.CertificatePVO;
import kr.or.ddit.vo.info.CertificateRecPVO;
import kr.or.ddit.vo.info.CertificateRecVO;
import kr.or.ddit.vo.info.CertificateVO;
import kr.or.ddit.vo.user.ProfessorVO;

@Service
public class CertificateServiceImplP implements CertificateServiceP{
	
	@Inject
	private CertificateDAOP dao;

	@Override
	public List<CertificatePVO> selectCrtfList() {
		return dao.selectCrtfList();
	}

	@Override
	public ServiceResult insertCrtfRec(CertificateRecPVO newRec) {
		int result = dao.insertCrtfRec(newRec);
		return result>0?ServiceResult.OK : ServiceResult.FAIL;
	}

	@Override
	public ProfessorVO selectRecord(String memNo) {
		return dao.selectRecord(memNo);
	}

	@Override
	public List<CertificateRecPVO> selectCertifiRecList(String memNo) {
		return dao.selectCertifiRecList(memNo);
	}

	@Override
	public ServiceResult insertCrtfGno(String recNo) {
		int result = dao.insertCrtfGno(recNo);
		return result>0?ServiceResult.OK : ServiceResult.FAIL;
	}

	@Override
	public ServiceResult updateCrtfRec(String recNoCnt) {
		int result = dao.updateCrtfRec(recNoCnt);
		return result>0?ServiceResult.OK : ServiceResult.FAIL;
	}

	@Override
	public List<CertificateGnoPVO> selectGno(CertificateGnoPVO cerVo) {
		return dao.selectGno(cerVo);
	}

}
