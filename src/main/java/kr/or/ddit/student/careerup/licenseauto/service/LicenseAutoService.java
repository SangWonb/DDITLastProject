package kr.or.ddit.student.careerup.licenseauto.service;

import kr.or.ddit.enumpkg.ServiceResult;
import kr.or.ddit.vo.careerup.LicenseEnrollVO;

public interface LicenseAutoService {
	
	/**
	 * 자격증 이름을 넣으면 자격증 코드를 반환 
	 * @param LicenNm
	 * @return 자격증 코드를 반환 / 없으면 null
	 */
	public String findLicenseCode(String LicenNm);
	
	/**
	 * 자격증 자동 등록에서 자격증 등록하는 내용
	 * @param licenseEnroll
	 * @return
	 */
	public ServiceResult createLicenseAuto(LicenseEnrollVO licenseEnroll);
	
}
