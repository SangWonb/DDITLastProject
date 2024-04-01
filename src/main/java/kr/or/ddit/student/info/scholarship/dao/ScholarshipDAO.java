package kr.or.ddit.student.info.scholarship.dao;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;

import kr.or.ddit.vo.info.ScholashipRecVO;

@Mapper
public interface ScholarshipDAO {
	public List<ScholashipRecVO> scholashipRecList(String memNo);
}
