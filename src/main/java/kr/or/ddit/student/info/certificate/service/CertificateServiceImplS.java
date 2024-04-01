package kr.or.ddit.student.info.certificate.service;

import java.util.List;

import javax.inject.Inject;

import org.springframework.stereotype.Service;

import kr.or.ddit.enumpkg.ServiceResult;
import kr.or.ddit.student.info.certificate.dao.CertificateDAO;
import kr.or.ddit.vo.info.CertificateGnoVO;
import kr.or.ddit.vo.info.CertificateRecVO;
import kr.or.ddit.vo.info.CertificateVO;
import kr.or.ddit.vo.user.ProfessorVO;
import kr.or.ddit.vo.user.StudentVO;

@Service
public class CertificateServiceImplS implements CertificateServiceS{

	@Inject
	private CertificateDAO dao;

	@Override
	public List<CertificateVO> selectCrtfList() {
		return dao.selectCrtfList();
	}

	@Override
	public ServiceResult insertCrtfRec(CertificateRecVO newRec) {
		int result = dao.insertCrtfRec(newRec);
		return result>0?ServiceResult.OK : ServiceResult.FAIL;
	}

	@Override
	public List<StudentVO> selectRecord(String smemNo) {
		return dao.selectRecord(smemNo);
	}
	
	@Override
	public List<CertificateRecVO> selectCertifiRecList(String memNo) {
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
	public List<CertificateGnoVO> selectGno(CertificateGnoVO cerVo){
		return dao.selectGno(cerVo);
	}
}
