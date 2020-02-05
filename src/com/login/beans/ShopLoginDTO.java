package com.login.beans;

public class ShopLoginDTO {
	private int sh_uid;
	private String sh_id;
	private String sh_pw;
	private String sh_name;
	
	
	// 기본 생성자
	public ShopLoginDTO() {
		super();
	}

	// 매개변수 받는 생성자 
	public ShopLoginDTO(int sh_uid, String sh_id, String sh_pw, String sh_name) {
		super();
		this.sh_uid = sh_uid;
		this.sh_id = sh_id;
		this.sh_pw = sh_pw;
		this.sh_name = sh_name;
	}

	// getter / setter
	public int getSh_uid() {
		return sh_uid;
	}

	public void setSh_uid(int sh_uid) {
		this.sh_uid = sh_uid;
	}

	public String getSh_id() {
		return sh_id;
	}

	public void setSh_id(String sh_id) {
		this.sh_id = sh_id;
	}

	public String getSh_pw() {
		return sh_pw;
	}

	public void setSh_pw(String sh_pw) {
		this.sh_pw = sh_pw;
	}

	public String getSh_name() {
		return sh_name;
	}

	public void setSh_name(String sh_name) {
		this.sh_name = sh_name;
	}
	
	// 디버깅용
	@Override
	public String toString() {
		return "ShopLoginDTO ]" + sh_uid + " : " + sh_id + " : " + sh_pw + " : " + sh_name;
	}

	
	
	
}
