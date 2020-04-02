package com.book_show.beans;

import java.sql.Timestamp;

public class BookShopDTO {
	private String use_name;
	private int bo_uid; 
	private Timestamp bo_time; 
	private String bo_service; 
	private int bo_stat;
	private int sh_uid;
	
	public BookShopDTO(String use_name, int bo_uid, Timestamp bo_time, String bo_service, int bo_stat, int sh_uid) {
		super();
		this.use_name = use_name;
		this.bo_uid = bo_uid;
		this.bo_time = bo_time;
		this.bo_service = bo_service;
		this.bo_stat = bo_stat;
		this.sh_uid = sh_uid;
	}
	public BookShopDTO() {
		super();
	}
	
	public String getUse_name() {
		return use_name;
	}
	public void setUse_name(String use_name) {
		this.use_name = use_name;
	}
	public int getBo_uid() {
		return bo_uid;
	}
	public void setBo_uid(int bo_uid) {
		this.bo_uid = bo_uid;
	}
	public Timestamp getBo_time() {
		return bo_time;
	}
	public void setBo_time(Timestamp bo_time) {
		this.bo_time = bo_time;
	}
	public String getBo_service() {
		return bo_service;
	}
	public void setBo_service(String bo_service) {
		this.bo_service = bo_service;
	}	
	public int getBo_stat() {
		return bo_stat;
	}
	public void setBo_stat(int bo_stat) {
		this.bo_stat = bo_stat;
	}
	public int getSh_uid() {
		return sh_uid;
	}
	public void setSh_uid(int sh_uid) {
		this.sh_uid = sh_uid;
	}
}



