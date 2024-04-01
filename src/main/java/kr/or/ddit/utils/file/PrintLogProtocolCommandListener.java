package kr.or.ddit.utils.file;

import org.apache.commons.net.ProtocolCommandEvent;
import org.apache.commons.net.ProtocolCommandListener;
import org.apache.commons.net.ftp.FTPClient;
import org.apache.commons.net.ftp.FTPReply;

import lombok.extern.slf4j.Slf4j;

@Slf4j
public class PrintLogProtocolCommandListener implements ProtocolCommandListener {

	@Override
	public void protocolCommandSent(ProtocolCommandEvent event) {
		FTPClient ftpClient = (FTPClient) event.getSource();
		if(event.isCommand()) {
			String command = event.getCommand();
			String host = ftpClient.getRemoteAddress().getHostAddress();
			log.info("send command [{}] to {}", command, host);
		}
	}

	@Override
	public void protocolReplyReceived(ProtocolCommandEvent event) {
		FTPClient ftpClient = (FTPClient) event.getSource();
		if(event.isReply()) {
			String message = event.getMessage();
			String host = ftpClient.getRemoteAddress().getHostAddress();
			int replyCode = event.getReplyCode();
			
			if(FTPReply.isPositiveCompletion(replyCode)) {
				log.info("[{}]로부터 받은 완료 메시지 : {}", host, message);
			}else if(FTPReply.isPositiveIntermediate(replyCode)) {
				log.info("[{}]로부터 받은 중간 메시지 : {}", host, message);
			}else if(FTPReply.isPositivePreliminary(replyCode)) {
				log.info("[{}]로부터 받은 임시 메시지 : {}", host, message);
			}else {
				log.info("[{}]로부터 받은 응답 코드 {}, 메시지 : {}", host, replyCode, message);
			}
		}
	}

}
