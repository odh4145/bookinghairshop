package com.change.beans;

public class DeleteUserDTO {
	private int use_uid;
	private String use_pw;
	
	// 기본생성자
	public DeleteUserDTO() {
		super();
	}

	// 매개변수 받는 생성자
	public DeleteUserDTO(int use_uid, String use_pw) {
		super();
		this.use_uid = use_uid;
		this.use_pw = use_pw;
		System.out.println("DeleteDTO(use_uid, use_pw) 객체 생성");
	}

	// getter / setter
	public int getUse_uid() {
		return use_uid;
	}

	public void setUse_uid(int use_uid) {
		this.use_uid = use_uid;
	}
	
	public String getUse_pw() {
		return use_pw;
	}

	public void setUse_pw(String use_pw) {
		this.use_pw = use_pw;
	}

	@Override
	public String toString() {
		return "DeleteUserDTO ]" + use_uid + " : " + use_pw;
	}
	
	
	
}
