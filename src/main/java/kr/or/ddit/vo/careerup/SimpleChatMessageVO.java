package kr.or.ddit.vo.careerup;

import java.io.Serializable;

public class SimpleChatMessageVO implements Serializable{
    private String sender;
    private String message;
    private String timestamp;

    public SimpleChatMessageVO(String sender, String chatMessage, String formattedTimestamp) {
    	this.sender = sender;
        this.message = chatMessage;
        this.timestamp = formattedTimestamp;
	}

    public String getSender() {
        return sender;
    }

    public void setSender(String sender) {
        this.sender = sender;
    }

    public String getMessage() {
        return message;
    }

    public void setMessage(String message) {
        this.message = message;
    }

    public String getTimestamp() {
        return timestamp;
    }

    public void setTimestamp(String timestamp) {
        this.timestamp = timestamp;
    }
}
