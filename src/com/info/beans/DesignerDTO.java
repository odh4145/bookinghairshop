package com.info.beans;

public class DesignerDTO {
	private int de_uid;
	private String de_name;
	private String de_position;
	private int de_career;
	private String de_major;
	private String de_picture;
	private int sh_uid;
	
	// 기본생성자
	public DesignerDTO() {	
		super();
		System.out.println("DesignerDTO() 객체 생성");
	}
	
	// 매개변수 받는 생성자
	public DesignerDTO(int de_uid, String de_name, String de_position,
			int de_career, String de_major, String de_picture, int sh_uid) {
		super();
		this.de_uid = de_uid;
		this.de_name = de_name;
		this.de_position = de_position;
		this.de_career = de_career;
		this.de_major = de_major;
		this.de_picture = de_picture;
		this.sh_uid = sh_uid;
		System.out.println("de_uid : " + this.de_uid + " 객체 생성");
	}

	public int getDe_uid() {
		return de_uid;
	}

	public void setDe_uid(int de_uid) {
		this.de_uid = de_uid;
	}

	public String getDe_name() {
		return de_name;
	}

	public void setDe_name(String de_name) {
		this.de_name = de_name;
	}

	public String getDe_position() {
		return de_position;
	}

	public void setDe_position(String de_position) {
		this.de_position = de_position;
	}

	public int getDe_career() {
		return de_career;
	}

	public void setDe_career(int de_career) {
		this.de_career = de_career;
	}

	public String getDe_major() {
		return de_major;
	}

	public void setDe_major(String de_major) {
		this.de_major = de_major;
	}

	public String getDe_picture() {
		return de_picture;
	}

	public void setDe_picture(String de_picture) {
		this.de_picture = de_picture;
	}

	public int getSh_uid() {
		return sh_uid;
	}

	public void setSh_uid(int sh_uid) {
		this.sh_uid = sh_uid;
	}

	// 디버깅용
	@Override
	public String toString() {
		return "DesignerDTO ] " + de_uid + ":" + de_name + ":" + de_position + ":" +  
				de_career + ":" + de_major + ":" + de_picture +  ":" + sh_uid;
	}
	
}








