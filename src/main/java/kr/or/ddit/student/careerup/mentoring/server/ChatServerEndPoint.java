package kr.or.ddit.student.careerup.mentoring.server;

import java.io.IOException;
import java.time.LocalDateTime;
import java.time.format.DateTimeFormatter;
import java.util.Collections;
import java.util.HashSet;
import java.util.List;
import java.util.Set;

import javax.annotation.PostConstruct;
import javax.inject.Inject;
import javax.json.Json;
import javax.websocket.EncodeException;
import javax.websocket.OnClose;
import javax.websocket.OnError;
import javax.websocket.OnMessage;
import javax.websocket.OnOpen;
import javax.websocket.Session;
import javax.websocket.server.PathParam;
import javax.websocket.server.ServerEndpoint;

import org.springframework.security.core.Authentication;
import org.springframework.stereotype.Component;

import com.fasterxml.jackson.databind.ObjectMapper;
import com.fasterxml.jackson.databind.SerializationFeature;

import kr.or.ddit.student.careerup.mentoring.server.config.ChatServerAppConfig;
import kr.or.ddit.student.careerup.mentoring.server.model.ChatMessage;
import kr.or.ddit.student.careerup.mentoring.server.model.Message;
import kr.or.ddit.student.careerup.mentoring.server.model.UsersMessage;
import kr.or.ddit.student.careerup.mentoring.server.model.decoder.MessageDecoder;
import kr.or.ddit.student.careerup.mentoring.server.model.encoder.MessageEncoder;
import kr.or.ddit.student.careerup.mentoring.service.MentoringMessageService;
import kr.or.ddit.vo.careerup.MentoringMessageVO;
import kr.or.ddit.vo.user.MemberVO;
import kr.or.ddit.vo.user.MemberVOWrapper;
import lombok.extern.slf4j.Slf4j;

@Slf4j
@Component
@ServerEndpoint(value = "/chat/{chatId}", encoders = { MessageEncoder.class }, decoders = { MessageDecoder.class }, configurator = ChatServerAppConfig.class)
public class ChatServerEndPoint {
	
	private Set<Session> chatroomUsers = Collections.synchronizedSet(new HashSet<Session>());
	
	@Inject
	MentoringMessageService service;
	
	@PostConstruct
	public void init() {
		log.info("\n\n{}\n\n",service);
	}

	/**
	 * Handshaking 함수
	 *
	 * @param userSession 사용자 session
	 */
	@OnOpen
	public void handleOpen(Session userSession, @PathParam("chatId") final String chatId) throws IOException, EncodeException {
		// WebSocket 세션에서 현재 사용자의 인증 정보
		Authentication authentication = (Authentication) userSession.getUserPrincipal();
		// 사용자의 Principal에서 MemberVOWrapper 객체
		MemberVOWrapper principal = (MemberVOWrapper) authentication.getPrincipal();
		// MemberVOWrapper에서 실제 사용자 정보
		MemberVO realUser = principal.getRealUser();
		// 사용자의 회원 번호
		String memNo = realUser.getMemNo();
		// WebSocket 세션의 사용자 속성에 "chatId" 키와 해당하는 값(chatId) 설정
		userSession.getUserProperties().put("chatId", chatId);
		// 현재 사용자의 WebSocket 세션을 채팅방 사용자 목록(chatroomUsers)에 추가
		chatroomUsers.add(userSession);
		log.info("\n\n\n{}\n\n\n",chatId);
		
		// DB에 저장된 채팅 내용 가져오기
		List<MentoringMessageVO> retrieveChatMessageList = service.retrieveChatMessageList(chatId, memNo);
		
		// ObjectMapper 객체 생성
	    ObjectMapper objectMapper = new ObjectMapper();
	    objectMapper.configure(SerializationFeature.WRITE_DATES_AS_TIMESTAMPS, false); // 날짜를 문자열로 변환

	    // 각 메시지를 클라이언트에 전송
	    for (MentoringMessageVO vo : retrieveChatMessageList) {
	        // 각 메시지에서 필요한 데이터 추출
	        String name = vo.getMemName(); // 발신자
	        String message = vo.getChatMessage(); // 채팅 메시지
	        LocalDateTime timestamp = vo.getChatTime(); // 타임스탬프

	        log.info("\n\n\n{}/{}/{}\n\n\n",name,message,timestamp);
	        
	        // 타임스탬프를 문자열로 변환
	        String formattedTimestamp = timestamp.format(DateTimeFormatter.ofPattern("yyyy-MM-dd HH:mm:ss"));

	        String chatting = Json.createObjectBuilder().add("messageType", "ChatMessage").add("name", name).add("message",message).
	        							add("time",formattedTimestamp).build().toString();
	        userSession.getBasicRemote().sendText(chatting);
	        
	    }
		
		log.debug("handleOpen chatId {}", chatId);
		log.debug("handleOpen userSession {}", userSession);
		log.debug("handleOpen userSession id {}", userSession.getId());
		
	}

	/**
	 * 메시지 전달 함수
	 *
	 * @param incomingMessage 들어오는 메시지
	 * @param userSession     사용자 session
	 * @param chatId            room Id
	 * @throws IOException
	 * @throws EncodeException
	 */
	@OnMessage
	public void handleMessage(Message incomingMessage, Session userSession, @PathParam("chatId") final String chatId) throws IOException, EncodeException {
		
		// 기존 로직
		ChatMessage incomingChatMessage = (ChatMessage) incomingMessage;
		ChatMessage outgoingChatMessage = new ChatMessage();
		// 현재 사용자의 MemNo 꺼내기
		Authentication authentication = (Authentication) userSession.getUserPrincipal();
		MemberVOWrapper principal = (MemberVOWrapper) authentication.getPrincipal();
		MemberVO realUser = principal.getRealUser();
		String memNo = realUser.getMemNo();
		

		log.info("chatId {}", chatId);
		log.info("incomingChatMessage {}", incomingChatMessage);
		log.info("outgoingChatMessage {}", outgoingChatMessage);
		
		// 웹소켓 세션에서 사용자 이름을 가지고 온다..
		String username = (String) userSession.getUserProperties().get("username");
		
		if (username == null) {

			username = incomingChatMessage.getMessage();
			if (username != null) {
				userSession.getUserProperties().put("username", username);
			}

			synchronized (chatroomUsers) {
				for (Session session : chatroomUsers) {
					session.getBasicRemote().sendObject(new UsersMessage(getUsers()));
				}
			}
		} else {
			outgoingChatMessage.setName(username);
			outgoingChatMessage.setMessage(incomingChatMessage.getMessage());

			for (Session session : chatroomUsers) {
				session.getBasicRemote().sendObject(outgoingChatMessage);
			}
		}
		
		// 보낸 메세지 꺼내기
		String message = outgoingChatMessage.getMessage();
		log.info("\n\n\n message1 => {}\n\n\n",message);
		if(message != null) {
			log.info("\n\n\n message2 => {}\n\n\n",message);
			// vo 객체 만들어서 data set
			MentoringMessageVO vo = new MentoringMessageVO();
			vo.setChatId(chatId);
			vo.setChatMessage(message);
			vo.setMemNo(memNo);
			
			// 사용자가 보낸 메세지 DB에 Insert 하기
			service.createChatMessage(vo);
		}
	}

	// 누군가가 접속 끊을때
	@OnClose
	public void handleClose(Session userSession, @PathParam("chatId") final String chatId) throws IOException, EncodeException {
		chatroomUsers.remove(userSession);

		for (Session session : chatroomUsers) {
			session.getBasicRemote().sendObject(new UsersMessage(getUsers()));
		}
	}

	/**
	 * 사용자가 접속 끊기 전 호출되는 함수
	 *
	 * @param session
	 * @param throwable
	 * @param chatId
	 */
	@OnError
	public void handleError(Session session, Throwable throwable, @PathParam("chatId") final String chatId) {
		// Error handling
		log.debug("ChatServerEndPoint (chatId : {}) occured Exception!", chatId);
		log.debug("Exception : {} ", throwable.getMessage());
		log.error(throwable.getMessage(), throwable);
	}

	/**
	 * 사용자 정보를 가져오는 함수
	 *
	 * @return
	 */
	private Set<String> getUsers() {
		HashSet<String> returnSet = new HashSet<String>();

		for (Session session : chatroomUsers) {
			if (session.getUserProperties().get("username") != null) {
				returnSet.add(session.getUserProperties().get("username").toString());
			}
		}
		return returnSet;
	}

}
