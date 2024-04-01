package kr.or.ddit.student.careerup.employment.graduateemployment.dao;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;

import kr.or.ddit.vo.careerup.SeniorCoworkerVO;

@Mapper
public interface GraduateEmploymentChartDAOS {
	public List<SeniorCoworkerVO> companyType();
	public List<SeniorCoworkerVO> companyLoc();
	public List<SeniorCoworkerVO> companyJob();
}
