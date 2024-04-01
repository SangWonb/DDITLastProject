package kr.or.ddit.student.careerup.licenserecom.dao;

import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Param;

import kr.or.ddit.vo.careerup.LicenseRecomVO;

@Mapper
public interface LicenseRecomDAOS {
	public LicenseRecomVO selectLicenseRecom(@Param("licenDept") String licenDept,@Param("licenJob") String licenJob);
}
