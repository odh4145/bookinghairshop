package com.change.beans;

public interface changeUserInterface {
	public static final String DRIVER = "org.mariadb.jdbc.Driver";
	public static final String URL = "jdbc:mariadb://localhost:3306/mydb";
	public static final String USERID = "myuser";
	public static final String USERPW = "1234";
	
	
	public static final String CHANGE_USER_INFO = 
			"select * from user where use_uid=?";
	
	public static final String CHANGE_USER_PW = 
			"update user set use_pw = ? where use_uid = ?";
	
}
