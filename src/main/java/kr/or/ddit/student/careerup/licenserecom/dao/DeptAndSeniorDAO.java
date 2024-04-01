package kr.or.ddit.student.careerup.licenserecom.dao;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.annotations.Mapper;

/**
 * 동적으로 학과와 직무를 생성 (자격증추천)
 * @author PC-11
 *
 */
@Mapper
public interface DeptAndSeniorDAO {
	public List<Map<String, Object>> selectDeptList();
	public List<Map<String, Object>> selectSeniorJobList();
	public List<Map<String, Object>> selectSeniorCompanyTypeList();
}
