package kr.or.ddit.student.careerup.mentoring.service;

import java.util.List;

import javax.inject.Inject;

import org.springframework.stereotype.Service;

import kr.or.ddit.enumpkg.ServiceResult;
import kr.or.ddit.student.careerup.mentoring.dao.MentoringMessageDAO;
import kr.or.ddit.vo.careerup.MentoringMessageVO;

@Service
public class MentoringMessageServiceImpl implements MentoringMessageService {
	
	@Inject
	MentoringMessageDAO dao;

	@Override
	public List<MentoringMessageVO> retrieveChatMessageList(String chatId, String memNo) {
		return dao.selectChatMessageList(chatId, memNo);
	}

	@Override
	public ServiceResult createChatMessage(MentoringMessageVO vo) {
		ServiceResult result = null;
		if(vo.getChatMessage() != null && !vo.getChatMessage().trim().equals("")) {
			result = dao.insertChatMessage(vo) > 0 ? ServiceResult.OK : ServiceResult.FAIL;
		} else {
			result = ServiceResult.FAIL;
		}
		return result;
	}
}