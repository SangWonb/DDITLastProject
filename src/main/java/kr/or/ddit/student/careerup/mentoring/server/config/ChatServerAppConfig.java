package kr.or.ddit.student.careerup.mentoring.server.config;

import java.util.Map;

import javax.websocket.HandshakeResponse;
import javax.websocket.server.HandshakeRequest;
import javax.websocket.server.ServerEndpointConfig;
import javax.websocket.server.ServerEndpointConfig.Configurator;

import org.springframework.web.context.ContextLoader;
import org.springframework.web.context.WebApplicationContext;

/**
 * @Class Name : ChatServerAppConfig.java
 * @Description : 사용자리스트에서 다른사용자 선택 시, 사용자와 대화가능한 방(새로운 EndPoint 객체)을 만드는
 *              Configurator
 */
public class ChatServerAppConfig extends Configurator {

	// 대화창 서버객체(ChatServerEndPoint) 저장하는 Map
//	private final static Map<String, ChatServerEndPoint> endpointMap = new HashMap<String, ChatServerEndPoint>();
	private String currentUri;

	@SuppressWarnings("unchecked")
	@Override
	public <T> T getEndpointInstance(Class<T> endpointClass) throws InstantiationException {
		WebApplicationContext wac = ContextLoader.getCurrentWebApplicationContext();
		if (wac == null) {
			throw new IllegalStateException(
					"Failed to find WebApplicationContext. Was org.springframework.web.context.ContextLoader used to load the WebApplicationContext?");
		}

		Map<String, T> beans = wac.getBeansOfType(endpointClass);
		System.err.println("beansChat"+beans);
		if (beans.isEmpty()) {
			// Initialize a new bean instance
			return wac.getAutowireCapableBeanFactory().createBean(endpointClass);
		}
		if (beans.size() == 1) {
			// Return the matching bean instance
			return beans.values().iterator().next();
		} else {
			// This should never happen (@ServerEndpoint has a single path mapping) ..
			throw new IllegalStateException("Found more than one matching beans of type " + endpointClass);
		}
	}

	@Override
	public void modifyHandshake(ServerEndpointConfig sec, HandshakeRequest request, HandshakeResponse response) {
		currentUri = request.getRequestURI().toString();
		super.modifyHandshake(sec, request, response);
	}
}
