package com.change.beans;

public interface DeleteUserInterface {
	public static final String DRIVER = "org.mariadb.jdbc.Driver";
	public static final String URL = "jdbc:mariadb://localhost:3306/mydb";
	public static final String USERID = "myuser";
	public static final String USERPW = "1234";
	
	
	public static final String DELETE_USER = 
			"delete from user WHERE use_uid = ?";

	public static final String DELETE_USER_INFO = 
			"select * from user where use_uid=?";
}
