package kr.or.ddit.student.careerup.mentoring.dao;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;

import kr.or.ddit.vo.careerup.MenteeVO;
import kr.or.ddit.vo.careerup.MentoringProgramVO;

@Mapper
public interface MentoringChatDAOS {
	public List<MentoringProgramVO> selectMenteeMentoringList(String memNo);
	public List<MentoringProgramVO> selectMentorMentoringList(String smemNo);
	public int insertChatId(MentoringProgramVO vo);
}
