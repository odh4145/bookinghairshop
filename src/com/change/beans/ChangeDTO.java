package com.change.beans;

public class ChangeDTO {
	private int use_uid;
	private String use_id;
	private String use_pw;
	private String use_name;
	//private String use_phoneNum;
	
	// 기본생성자
	public ChangeDTO() {
		super();
	}
	
	// 매개변수 받는 생성자
	public ChangeDTO(int use_uid, String use_id, String use_pw, String use_name/*, String use_phoneNum*/) {
		super();
		this.use_uid = use_uid;
		this.use_id = use_id;
		this.use_pw = use_pw;
		this.use_name = use_name;
		/*this.use_phoneNum = use_phoneNum;*/
		System.out.println("ChangeDTO(use_uid, use_id, use_pw, use_name, "+/*use_phoneNum*/") 객체 생성");
	}

	// getter / setter
	public int getUse_uid() {
		return use_uid;
	}

	public void setUse_uid(int use_uid) {
		this.use_uid = use_uid;
	}

	public String getUse_id() {
		return use_id;
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
/*
	public String getUse_phoneNum() {
		return use_phoneNum;
	}

	public void setUse_phoneNum(String use_phoneNum) {
		this.use_phoneNum = use_phoneNum;
	}
*/
	// 디버깅용
	@Override
	public String toString() {
		return "ChangeDTO ]" + use_uid + " : " + use_id + " : " 
				+ use_pw + " : " + use_name /*+ " : " + use_phoneNum*/;
	}
	
	
	
	
	
}
