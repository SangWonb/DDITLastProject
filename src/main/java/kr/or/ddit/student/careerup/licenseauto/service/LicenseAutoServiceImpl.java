package kr.or.ddit.student.careerup.licenseauto.service;

import javax.inject.Inject;

import org.springframework.stereotype.Service;

import kr.or.ddit.enumpkg.ServiceResult;
import kr.or.ddit.student.careerup.licenseauto.dao.LicenseAutoDAO;
import kr.or.ddit.vo.careerup.LicenseEnrollVO;

@Service
public class LicenseAutoServiceImpl implements LicenseAutoService {
	
	@Inject
	LicenseAutoDAO dao;

	@Override
	public String findLicenseCode(String LicenNm) {
		return dao.findLicenCode(LicenNm);
	}

	@Override
	public ServiceResult createLicenseAuto(LicenseEnrollVO licenseEnroll) {
		return dao.LicenseAutoAdd(licenseEnroll) >  0 ? ServiceResult.OK : ServiceResult.FAIL;
	}

}
