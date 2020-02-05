package com.change.beans;

public class DeleteShopDTO {
	private int sh_uid;
	private String sh_pw;
	
	public DeleteShopDTO() {
		super();
	}

	public DeleteShopDTO(int sh_uid, String sh_pw) {
		super();
		this.sh_uid = sh_uid;
		this.sh_pw = sh_pw;
	}

	public int getSh_uid() {
		return sh_uid;
	}

	public void setSh_uid(int sh_uid) {
		this.sh_uid = sh_uid;
	}

	public String getSh_pw() {
		return sh_pw;
	}

	public void setSh_pw(String sh_pw) {
		this.sh_pw = sh_pw;
	}

	@Override
	public String toString() {
		return "DeleteShopDTO [sh_uid=" + sh_uid + ", sh_pw=" + sh_pw + "]";
	}
	
	
	
}
