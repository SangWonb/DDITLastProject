package kr.or.ddit.member.login.vo;

import java.util.Date;

public class AuthData {
	private long time;
	private String numberString;

	public AuthData(String numberString){
	    this.numberString = numberString;
	    this.time = new Date().getTime();
	}

    public String getNumberString(){
        return numberString;
    }

    public long getTime(){
        return time;
    }
	
}
