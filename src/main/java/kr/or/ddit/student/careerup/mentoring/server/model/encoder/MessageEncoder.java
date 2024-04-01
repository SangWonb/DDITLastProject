package kr.or.ddit.student.careerup.mentoring.server.model.encoder;

import java.util.Set;

import javax.json.Json;
import javax.json.JsonArrayBuilder;
import javax.websocket.EncodeException;
import javax.websocket.Encoder;
import javax.websocket.EndpointConfig;

import kr.or.ddit.student.careerup.mentoring.server.model.ChatMessage;
import kr.or.ddit.student.careerup.mentoring.server.model.Message;
import kr.or.ddit.student.careerup.mentoring.server.model.UsersMessage;

/**
 * @Class Name : MessageEncoder.java
 * @Description : 서버에서 클라이언트로 전달되는 메시지를 encoding하는 클래스
 */
public class MessageEncoder implements Encoder.Text<Message> {

	@Override
	public void destroy() {
	}

	@Override
	public void init(EndpointConfig endPointConfig) {
	}

	/**
	 * 서버에서 클라이언트로 전달되는 메시지를 encoding하는 함수
	 */
	@Override
	public String encode(Message message) throws EncodeException {

		String result = null;
		if (message instanceof ChatMessage) {
			ChatMessage chatMessage = (ChatMessage) message;
			result = Json.createObjectBuilder().add("messageType", chatMessage.getClass().getSimpleName())
					.add("name", chatMessage.getName()).add("message", chatMessage.getMessage()).build().toString();
		} else if (message instanceof UsersMessage) {
			UsersMessage userMessage = (UsersMessage) message;
			result = buildJsonUserData(userMessage.getUsers(), userMessage.getClass().getSimpleName());
		}
		return result;
	}

	private String buildJsonUserData(Set<String> set, String messageType) {
		JsonArrayBuilder jsonArrayBuilder = Json.createArrayBuilder();

		for (String user : set) {
			jsonArrayBuilder.add(user);
		}
		return Json.createObjectBuilder().add("messageType", messageType).add("users", jsonArrayBuilder).build()
				.toString();
	}

}
