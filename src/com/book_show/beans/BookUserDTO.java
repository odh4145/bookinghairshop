package com.book_show.beans;

import java.sql.Timestamp;

import common.K;

public class BookUserDTO implements K {
private String bo_service;
private Timestamp bo_time;
private String bo_comment;
private String sh_telephone;
private String sh_location;
private String sh_name;
private String use_name;
private int sh_uid;
private int bo_uid;
private int use_uid;
private int bo_stat;

public String getBo_service() {
	return bo_service;
}
public void setBo_service(String bo_sevice) {
	this.bo_service = bo_sevice;
}
public Timestamp getBo_time() {
	return bo_time;
}
public void setSh_name(String sh_name) {
	this.sh_name = sh_name;
}
public String getSh_name() {
	return sh_name;
}
public void setUse_name(String use_name) {
	this.use_name = use_name;
}
public String getUse_name() {
	return use_name;
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
public int getSh_uid() {
	return sh_uid;
}
public void setSh_uid(int sh_uid) {
	this.sh_uid = sh_uid;
}
public int getBo_uid() {
	return bo_uid;
}
public void setBo_uid(int bo_uid) {
	this.bo_uid = bo_uid;
}
public int getUse_uid() {
	return use_uid;
}
public void setUse_uid(int use_uid) {
	this.use_uid = use_uid;
}
public int getBo_stat() {
	return bo_stat;
}
public void setBo_stat(int bo_stat) {
	this.bo_stat = bo_stat;
}
public BookUserDTO(String bo_service, Timestamp bo_time, String bo_comment, String sh_telephone, String sh_location,
		int sh_uid, int bo_uid, int use_uid, int bo_stat, String sh_name, String use_name) {
	super();
	this.bo_service = bo_service;
	this.bo_time = bo_time;
	this.bo_comment = bo_comment;
	this.sh_telephone = sh_telephone;
	this.sh_location = sh_location;
	this.sh_uid = sh_uid;
	this.bo_uid = bo_uid;
	this.use_uid = use_uid;
	this.bo_stat = bo_stat;
	this.sh_name = sh_name;
	this.use_name = use_name;
}
public BookUserDTO() {
	super();
}

	
}
