package kr.or.ddit.student.careerup.mentoring.mentoringmentee.dao;

import org.apache.ibatis.annotations.Mapper;

import kr.or.ddit.vo.user.StudentVO;

@Mapper
public interface StudentForSenior {
	public int updateMentor(StudentVO vo);
}
