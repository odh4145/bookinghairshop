package com.info.beans;

import java.sql.Time;

public class ServiceDTO {
	private int ser_uid;
	private String ser_name;
	private int ser_price;
	private int ser_time;
	private int sh_uid;
	
	// 기본생성자
	public ServiceDTO() {	
		super();
		System.out.println("ServiceDTO() 객체 생성");
	}
	
	// 매개변수 받는 생성자
	public ServiceDTO(int ser_uid, String ser_name, int ser_price,
				int ser_time, int sh_uid) {
		super();
		this.ser_uid = ser_uid;
		this.ser_name = ser_name;
		this.ser_price= ser_price;
		this.ser_time = ser_time;
		this.sh_uid = sh_uid;
		System.out.println("ser_uid : " + this.ser_uid + " 객체 생성");
	}

	public int getSer_uid() {
		return ser_uid;
	}

	public void setSer_uid(int ser_uid) {
		this.ser_uid = ser_uid;
	}

	public String getSer_name() {
		return ser_name;
	}

	public void setSer_name(String ser_name) {
		this.ser_name = ser_name;
	}

	public int getSer_price() {
		return ser_price;
	}

	public void setSer_price(int ser_price) {
		this.ser_price = ser_price;
	}

	public int getSer_time() {
		return ser_time;
	}

	public void setSer_time(int ser_time) {
		this.ser_time = ser_time;
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
		return "ServiceDTO ] " + ser_uid + ":" + ser_name + ":" + ser_price + ":" +  
				ser_time + ":" + sh_uid;
	}
	
}








