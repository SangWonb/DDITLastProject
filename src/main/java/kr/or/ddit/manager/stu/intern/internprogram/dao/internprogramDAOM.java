package kr.or.ddit.manager.stu.intern.internprogram.dao;

import org.apache.ibatis.annotations.Mapper;

import kr.or.ddit.vo.careerup.InternshipVO;

@Mapper
public interface internprogramDAOM {
	public InternshipVO selectInternprogram(InternshipVO internship);
}
