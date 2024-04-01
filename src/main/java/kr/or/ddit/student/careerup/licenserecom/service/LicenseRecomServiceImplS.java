package kr.or.ddit.student.careerup.licenserecom.service;

import javax.inject.Inject;

import org.springframework.stereotype.Service;

import kr.or.ddit.student.careerup.licenserecom.dao.LicenseRecomDAOS;
import kr.or.ddit.vo.careerup.LicenseRecomVO;

@Service
public class LicenseRecomServiceImplS implements LicenseRecomServiceS {
	
	@Inject
	LicenseRecomDAOS dao;

	@Override
	public LicenseRecomVO licenseRecom(String licenDept, String licenJob) {
		return dao.selectLicenseRecom(licenDept, licenJob);
	}
}