package com.login.beans;

public interface UserLoginInterface {
	public static final String DRIVER = "org.mariadb.jdbc.Driver";
	public static final String URL = "jdbc:mariadb://localhost:3306/mydb";
	public static final String USERID = "myuser";
	public static final String USERPW = "1234";
	
	// 손님 로그인
	public static final String LOGIN_ID_SELECT = 
			"SELECT * FROM USER WHERE use_id=?";
}
