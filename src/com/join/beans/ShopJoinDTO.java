package com.join.beans;

public class ShopJoinDTO {
	private int sh_uid;
	private String sh_id;
	private String sh_pw;
	private String sh_no_id;
	private String sh_name;
	private String sh_telephone;
	private String sh_location;
	private String sh_location_lat;
	private String sh_location_lng;
	
	// 기본생성자
	public ShopJoinDTO() {
		super();
	}
	
	// 매개변수 받는 생성자
	public ShopJoinDTO(int sh_uid, String sh_id, String sh_pw, String sh_no_id,
			String sh_name, String sh_telephone, String sh_location,
			String sh_location_lat, String sh_location_lng) {
		super();
		this.sh_uid = sh_uid;
		this.sh_id = sh_id;
		this.sh_pw = sh_pw;
		this.sh_no_id = sh_no_id;
		this.sh_name = sh_name;
		this.sh_telephone = sh_telephone;
		this.sh_location = sh_location;
		this.sh_location_lat = sh_location_lat;
		this.sh_location_lng = sh_location_lng;
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

	public String getSh_no_id() {
		return sh_no_id;
	}

	public void setSh_no_id(String sh_no_id) {
		this.sh_no_id = sh_no_id;
	}

	public String getSh_name() {
		return sh_name;
	}

	public void setSh_name(String sh_name) {
		this.sh_name = sh_name;
	}

	public String getSh_telephone() {
		return sh_telephone;
	}

	public void setSh_telephone(String sh_telephone) {
		this.sh_telephone = sh_telephone;
	}

	public String getSh_location() {
		return sh_location;
	}

	public void setSh_location(String sh_location) {
		this.sh_location = sh_location;
	}

	public String getSh_location_lat() {
		return sh_location_lat;
	}

	public void setSh_location_lat(String sh_location_lat) {
		this.sh_location_lat = sh_location_lat;
	}

	public String getSh_location_lng() {
		return sh_location_lng;
	}

	public void setSh_location_lng(String sh_location_lng) {
		this.sh_location_lng = sh_location_lng;
	}
	
	

	// 디버깅용
	@Override
	public String toString() {
		return "ShopJoinDTO ] " + sh_uid + " : " + sh_id + " : " + sh_pw + " : " 
				+ sh_no_id + " : " + sh_name + " : " + sh_telephone + " : " 
				+ sh_location + " : " + sh_location_lat + " : " + sh_location_lng;
	}

	

	
	
	
	
	
}
