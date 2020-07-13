package com.itc.bbs.domain;

public class LoginVO {
	private String memNo;
	private String memId;
	private String memPasswd;
	private int cnt;

	public String getMemNo() {
		return memNo;
	}

	public void setMemNo(String memNo) {
		this.memNo = memNo;
	}

	public String getMemId() {
		return memId;
	}

	public void setMemId(String memId) {
		this.memId = memId;
	}

	public String getMemPasswd() {
		return memPasswd;
	}

	public void setMemPasswd(String memPasswd) {
		this.memPasswd = memPasswd;
	}

	public int getCnt() {
		return cnt;
	}

	public void setCnt(int cnt) {
		this.cnt = cnt;
	}

}
