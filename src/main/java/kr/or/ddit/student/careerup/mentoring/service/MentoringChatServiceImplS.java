package kr.or.ddit.student.careerup.mentoring.service;

import java.util.List;

import javax.inject.Inject;

import org.springframework.stereotype.Service;

import kr.or.ddit.student.careerup.mentoring.dao.MentoringChatDAOS;
import kr.or.ddit.vo.careerup.MentoringProgramVO;

@Service
public class MentoringChatServiceImplS implements MentoringChatServiceS {
	
	@Inject
	MentoringChatDAOS dao;

	@Override
	public List<MentoringProgramVO> retrieveMenteeMentoringList(String memNo) {
		return dao.selectMenteeMentoringList(memNo);
	}

	@Override
	public List<MentoringProgramVO> retrieveMentorMentoringList(String smemNo) {
		return dao.selectMentorMentoringList(smemNo);
	}

}
