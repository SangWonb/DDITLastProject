package kr.or.ddit.manager.stu.academicchange.dao;

import org.apache.ibatis.annotations.Mapper;

import kr.or.ddit.vo.user.StudentVO;

@Mapper
public interface StudentRecordDAOM {
	public int updateRecord(StudentVO student);
}
