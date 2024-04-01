package kr.or.ddit.student.careerup.licenseauto.dao;

import org.apache.ibatis.annotations.Mapper;

import kr.or.ddit.vo.careerup.LicenseEnrollVO;

@Mapper
public interface LicenseAutoDAO {
	
	// 자격증 이름 >> 자격증 코드 찾기
	public String findLicenCode (String LicenNm);
	
	// 자격증 자동 등록 - 등록
	public int LicenseAutoAdd (LicenseEnrollVO licenceEnroll);
	
}
