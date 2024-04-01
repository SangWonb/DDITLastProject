package kr.or.ddit.manager.stu.scholarship.dao;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;

import kr.or.ddit.utils.abMapper.AbstractCommonMapper;
import kr.or.ddit.vo.info.ScholashipVO;

@Mapper
public interface ScholarshipDAOM extends AbstractCommonMapper<ScholashipVO, String> {
}
