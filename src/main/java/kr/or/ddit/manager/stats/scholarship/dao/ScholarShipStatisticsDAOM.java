package kr.or.ddit.manager.stats.scholarship.dao;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;

import kr.or.ddit.vo.info.ScholashipRecVO;

@Mapper
public interface ScholarShipStatisticsDAOM {
	public List<ScholashipRecVO> selectDeptList();
	public List<ScholashipRecVO> selectScList();
}
