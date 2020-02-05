package com.join.beans;

public interface UserJoinInterface {
	public static final String DRIVER = "org.mariadb.jdbc.Driver";
	public static final String URL = "jdbc:mariadb://localhost:3306/mydb";
	public static final String USERID = "myuser";
	public static final String USERPW = "1234";
	
	// 손님 회원가입
	public static final String JOIN_USER_INSERT = 
			"INSERT INTO USER"
			+ "(use_id, use_pw, use_name, use_phoneNum)"
			+ " VALUES"
			+ " (?, ?, ?, ?)";
	
	public static final String JOIN_CHECK_ID =
			"SELECT "
			+ "	(SELECT count(*) from user where use_id = ?), " 
			+ "	(SELECT count(*) from shop where sh_id = ?)";
	
	public static final String JOIN_CHECK_PHONENUM = 
			"SELECT "
			+ " (select count(*) from user where use_phoneNum = ?), "  
			+ "	(select count(*) from shop where sh_telephone = ?)";
	
	

}
