package kr.or.ddit.utils.file;

import java.io.IOException;
import java.text.MessageFormat;

import org.apache.commons.net.ftp.FTP;
import org.apache.commons.net.ftp.FTPClient;
import org.apache.commons.net.ftp.FTPReply;
import org.apache.commons.pool2.BasePooledObjectFactory;
import org.apache.commons.pool2.PooledObject;
import org.apache.commons.pool2.impl.DefaultPooledObject;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.EqualsAndHashCode;
import lombok.extern.slf4j.Slf4j;

/**
 * FTPClient 객체 생성 -> FTPClient Pooling.
 * <pre>
 * 참고
 * 1. <a href='https://commons.apache.org/proper/commons-pool/examples.html'>Object Pooling</a> 
 * 2. <a href="https://commons.apache.org/proper/commons-net/examples/ftp/FTPClientExample.java">FTPClient example</a>
 * </pre>
 */
@Data
@EqualsAndHashCode(callSuper=false)
@AllArgsConstructor
@Slf4j
public class FTPClientFactory extends BasePooledObjectFactory<FTPClient>{
	private String host;
	private int port;
	private String user;
	private String password;
	private boolean passiveMode;
	private String encoding;
	private int fileType;	
	private int timeout;
	
	public FTPClientFactory(String host, String user, String password) {
		this(
			host, FTP.DEFAULT_PORT
			, user, password
			, false, "UTF-8"
			, FTP.ASCII_FILE_TYPE, 1000*10
		);
	}

	@Override
	public PooledObject<FTPClient> wrap(FTPClient ftpClient) {
		return new DefaultPooledObject<>(ftpClient);
	}
	
	@Override
	public FTPClient create() throws Exception {
		FTPClient ftpClient = new FTPClient();
		ftpClient.addProtocolCommandListener(new PrintLogProtocolCommandListener());
		try {
			ftpClient.setControlEncoding(encoding);
			ftpClient.connect(host, port);
			ftpClient.setSoTimeout(timeout);
			
			if(!ftpClient.login(user, password)) {
				log.error("[{}] 계정 로그인 실패", user);
				throw new IOException(String.format("[%s] 계정 로그인 실패", user));
			}
			
			int replyCode = ftpClient.getReplyCode();
			String replyMessage = ftpClient.getReplyString();
			if(FTPReply.isNegativePermanent(replyCode) || FTPReply.isNegativeTransient(replyCode)) {
				throw new IOException(replyMessage);
			}
			
			if(passiveMode)
				ftpClient.enterLocalPassiveMode();
			else
				ftpClient.enterLocalActiveMode();
			
			ftpClient.setFileType(fileType);
			
			log.info("{} 를 대상으로 FTPClient 생성", host);
			return ftpClient;
		}catch(Exception e) {
			if(ftpClient.isConnected())
				ftpClient.disconnect();
			throw e;
		}
	}
	
	@Override
	public void destroyObject(PooledObject<FTPClient> p) throws Exception {
		FTPClient ftpClient = p.getObject();
		if(ftpClient.isConnected())
			ftpClient.disconnect();
		p.invalidate();
		log.info("{}에 생성된 FTPClient 연결 종료", MessageFormat.format("{0,date} {0,time}", p.getCreateTime()));
	}
	
	@Override
	public boolean validateObject(PooledObject<FTPClient> p) {
		try {
			FTPClient ftpClient = p.getObject();
			ftpClient.sendNoOp();
			return ftpClient.isConnected() && ftpClient.isAvailable();
		} catch (IOException e) {
			log.error(e.getMessage(), e);
			return false;
		}
		
	}
	
	@Override
	public void passivateObject(PooledObject<FTPClient> p) throws Exception {
		p.getObject().changeWorkingDirectory("/");
		log.info("FTPClient return to POOL");
	}
}
