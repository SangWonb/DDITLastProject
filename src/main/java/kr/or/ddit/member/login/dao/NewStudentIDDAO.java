package kr.or.ddit.member.login.dao;

import org.apache.ibatis.annotations.Mapper;

import kr.or.ddit.utils.abMapper.AbstractCommonMapper;
import kr.or.ddit.utils.abMapper.AbstractCommonMapper2;
import kr.or.ddit.utils.abMapper.AbstractCommonMapper3;
import kr.or.ddit.vo.user.StudentVO;

/**
 * 신입생 학번 조회 (수험번호 + 생년월일) => StudentVO
 * @author PC-15
 */
@Mapper
public interface NewStudentIDDAO{
	
	public StudentVO select(StudentVO stu);
	
}
