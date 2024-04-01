package kr.or.ddit.student.info.dao;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;

import kr.or.ddit.vo.common.CalendarVO;

@Mapper
public interface InfoMainDAO{

	public List<CalendarVO> selectAList();
}
