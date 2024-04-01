package kr.or.ddit.student.careerup.employment.employmentreview.dao;

import org.apache.ibatis.annotations.Mapper;

import kr.or.ddit.utils.abMapper.AbstractCommonMapper;
import kr.or.ddit.vo.careerup.EmploymentReviewVO;

@Mapper
public interface EmploymentReviewDAOS extends AbstractCommonMapper<EmploymentReviewVO, String>{
}
