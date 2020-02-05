package com.info.beans;

import java.sql.Timestamp;

import common.K;

public class BookDTO implements K {
	private int bo_uid; 
	private String bo_service;
	private int bo_stat; 
	private Timestamp bo_time;
	private String bo_comment;
	private int use_uid; 
	private int sh_uid;
	public BookDTO(int bo_uid, String bo_service, int bo_stat, Timestamp bo_time, String bo_comment, int use_uid,
			int sh_uid) {
		super();
		this.bo_uid = bo_uid;
		this.bo_service = bo_service;
		this.bo_stat = bo_stat;
		this.bo_time = bo_time;
		this.bo_comment = bo_comment;
		this.use_uid = use_uid;
		this.sh_uid = sh_uid;
	}
	public BookDTO() {
		super();
	}
	
	public int getBo_uid() {
		return bo_uid;
	}
	public void setBo_uid(int bo_uid) {
		this.bo_uid = bo_uid;
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
	public Timestamp getBo_time() {
		return bo_time;
	}
	public void setBo_time(Timestamp bo_time) {
		this.bo_time = bo_time;
	}
	public String getBo_comment() {
		return bo_comment;
	}
	public void setBo_comment(String bo_comment) {
		this.bo_comment = bo_comment;
	}
	public int getUse_uid() {
		return use_uid;
	}
	public void setUse_uid(int use_uid) {
		this.use_uid = use_uid;
	}
	public int getSh_uid() {
		return sh_uid;
	}
	public void setSh_uid(int sh_uid) {
		this.sh_uid = sh_uid;
	}
	

}
