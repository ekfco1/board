package com.itc.bbs.domain;

public class ResponseVO {
	private int resNo;
	private int boardNo;
	private int memNo;
	private String resContent;
	private String memName;

	public String getMemName() {
		return memName;
	}

	public void setMemName(String memName) {
		this.memName = memName;
	}

	public int getMemNo() {
		return memNo;
	}

	public void setMemNo(int memNo) {
		this.memNo = memNo;
	}

	public int getResNo() {
		return resNo;
	}

	public void setResNo(int resNo) {
		this.resNo = resNo;
	}

	public int getBoardNo() {
		return boardNo;
	}

	public void setBoardNo(int boardNo) {
		this.boardNo = boardNo;
	}

	public String getResContent() {
		return resContent;
	}

	public void setResContent(String resContent) {
		this.resContent = resContent;
	}

}
