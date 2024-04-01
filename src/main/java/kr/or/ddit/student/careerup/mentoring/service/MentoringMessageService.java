package kr.or.ddit.student.careerup.mentoring.service;

import java.util.List;

import org.apache.ibatis.annotations.Param;

import kr.or.ddit.enumpkg.ServiceResult;
import kr.or.ddit.vo.careerup.MentoringMessageVO;

public interface MentoringMessageService {
	/**
	 * 채팅방 들어갈 때 이전 채팅 목록 조회
	 * @param chatId
	 * @param memNo
	 * @return
	 */
	public List<MentoringMessageVO> retrieveChatMessageList(@Param("chatId") String chatId, @Param("memNo") String memNo);
	/**
	 * 채팅을 보내면 DB에 저장
	 * @param vo
	 * @return
	 */
	public ServiceResult createChatMessage(MentoringMessageVO vo);
}