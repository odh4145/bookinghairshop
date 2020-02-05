package com.lec.beans;

public class ReplyDTO {
	private int re_uid;
	private String re_content;
	private int co_uid;
	private String re_regDate;
	
	public ReplyDTO() {
		super();
	}
	public ReplyDTO(int re_uid, String re_content, int co_uid, String re_regDate) {
		super();
		this.re_uid = re_uid;
		this.re_content = re_content;
		this.co_uid = co_uid;
		this.re_regDate = re_regDate;
	}
	public int getRe_uid() {
		return re_uid;
	}
	public void setRe_uid(int re_uid) {
		this.re_uid = re_uid;
	}
	public String getRe_content() {
		return re_content;
	}
	public void setRe_content(String re_content) {
		this.re_content = re_content;
	}
	public int getCo_uid() {
		return co_uid;
	}
	public void setCo_uid(int co_uid) {
		this.co_uid = co_uid;
	}
	public String getRe_regDate() {
		return re_regDate;
	}
	public void setRe_regDate(String re_regDate) {
		this.re_regDate = re_regDate;
	}
}
