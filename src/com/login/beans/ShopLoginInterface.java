package com.login.beans;

public interface ShopLoginInterface {
	public static final String DRIVER = "org.mariadb.jdbc.Driver";
	public static final String URL = "jdbc:mariadb://localhost:3306/mydb";
	public static final String USERID = "myuser";
	public static final String USERPW = "1234";
	
	// 매장 로그인
	public static final String LOGIN_ID_SELECT = 
			"SELECT * FROM SHOP WHERE sh_id=?";
}
