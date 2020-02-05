package com.lec.beans;

public class LogDTO {
	private int use_uid;
	private String use_id;
	private String use_pw;
	private String use_name;
	public int getUse_uid() {
		return use_uid;
	}
	public void setUse_uid(int use_uid) {
		this.use_uid = use_uid;
	}
	public String getUse_id() {
		return use_id;
	}
	public LogDTO() {
		super();
	}
	public LogDTO(int use_uid, String use_id, String use_pw, String use_name) {
		super();
		this.use_uid = use_uid;
		this.use_id = use_id;
		this.use_pw = use_pw;
		this.use_name = use_name;
	}
	public void setUse_id(String use_id) {
		this.use_id = use_id;
	}
	public String getUse_pw() {
		return use_pw;
	}
	public void setUse_pw(String use_pw) {
		this.use_pw = use_pw;
	}
	public String getUse_name() {
		return use_name;
	}
	public void setUse_name(String use_name) {
		this.use_name = use_name;
	}
}
