package com.change.beans;

public interface DeleteShopInterface {
	public static final String DRIVER = "org.mariadb.jdbc.Driver";
	public static final String URL = "jdbc:mariadb://localhost:3306/mydb";
	public static final String USERID = "myuser";
	public static final String USERPW = "1234";
	
	
	public static final String DELETE_SHOP = 
			"delete from shop WHERE sh_uid = ?";

	public static final String DELETE_SHOP_INFO = 
			"select * from shop where sh_uid=?";
}
