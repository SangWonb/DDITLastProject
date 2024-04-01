package kr.or.ddit.student.careerup.mentoring.server.model.decoder;

import java.io.StringReader;

import javax.json.Json;
import javax.json.JsonException;
import javax.json.JsonObject;
import javax.websocket.DecodeException;
import javax.websocket.Decoder;
import javax.websocket.EndpointConfig;

import kr.or.ddit.student.careerup.mentoring.server.model.ChatMessage;
import kr.or.ddit.student.careerup.mentoring.server.model.Message;

/**
 * @Class Name : MessageDecoder.java
 * @Description : 클라이언트에서 서버로 전달되는 메시지를 decoding하는 클래스
 */
public class MessageDecoder implements Decoder.Text<Message> {

	@Override
	public void destroy() {
	}

	@Override
	public void init(EndpointConfig endPointConfig) {
	}

	/**
	 * 화면에서 넘어오는 데이터를 decoding하는 함수
	 */
	@Override
	public Message decode(String message) throws DecodeException {
		ChatMessage chatMessage = new ChatMessage();

		JsonObject jsonObject = Json.createReader(new StringReader(message)).readObject();

		chatMessage.setMessage(jsonObject.getString("message"));

		chatMessage.setRoom(jsonObject.getString("chatId"));

		return chatMessage;
	}

	@Override
	public boolean willDecode(String message) {
		boolean flag = true;

		try {
			Json.createReader(new StringReader(message)).readObject();
		} catch (JsonException ex) {// KISA 보안약점 조치
			flag = false;
		} catch (Exception ex) {
			flag = false;
		}
		return flag;
	}

}
