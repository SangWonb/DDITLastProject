package kr.or.ddit.manager.stu.mentor.dao;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;

import kr.or.ddit.utils.abMapper.AbstractCommonMapper;
import kr.or.ddit.vo.careerup.SeniorCoworkerVO;
import kr.or.ddit.vo.user.StudentVO;

@Mapper
public interface MentorApplListDAOM extends AbstractCommonMapper<StudentVO, String> {
	public List<StudentVO> selectMetorApplList();
	public StudentVO selectMetorAppl(String smemNo);
	public int insertMentorAppl(SeniorCoworkerVO vo);
	public int updateAppl(String smemNo);
	public int updateApplDel(String smemNo);
}
