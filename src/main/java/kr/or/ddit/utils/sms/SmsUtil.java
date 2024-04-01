package kr.or.ddit.utils.sms;

import javax.annotation.PostConstruct;

import org.springframework.beans.factory.annotation.Value;
import org.springframework.stereotype.Component;

import net.nurigo.sdk.NurigoApp;
import net.nurigo.sdk.message.model.Message;
import net.nurigo.sdk.message.request.SingleMessageSendingRequest;
import net.nurigo.sdk.message.response.SingleMessageSentResponse;
import net.nurigo.sdk.message.service.DefaultMessageService;

@Component
public class SmsUtil {
	
	@Value("#{appInfo.coolsmsApiKey}")
	private String apiKey;
	@Value("#{appInfo.coolsmsApiSecret}")
	private String apiSecretKey;
	
	private static DefaultMessageService messageService;
	
	@PostConstruct
	private void init() {
		this.messageService = NurigoApp.INSTANCE.initialize("NCSIVPIPD8OBOVAQ", "2IQ8NHQM3PQDKDM6R1MSJDTPU3TJ0RIB", "https://api.coolsms.co.kr");
	}
	
	// 단일 메시지 발송 예제
    public static SingleMessageSentResponse sendOne(String to, String text) {
        Message message = new Message();
		// 발신번호 및 수신번호는 반드시 01012345678 형태로 입력되어야 합니다.
        message.setFrom("01066550108");
        message.setTo(to);
        message.setText(text);

        SingleMessageSentResponse response = messageService.sendOne(new SingleMessageSendingRequest(message));
        return response;
    }
	
}
