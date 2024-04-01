package kr.or.ddit.student.careerup.mentoring.service;

import java.util.List;

import kr.or.ddit.vo.careerup.MentoringProgramVO;

public interface MentoringChatServiceS {
	public List<MentoringProgramVO> retrieveMenteeMentoringList(String memNo);
	public List<MentoringProgramVO> retrieveMentorMentoringList(String smemNo);
}
