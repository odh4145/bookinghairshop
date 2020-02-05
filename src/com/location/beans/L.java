package com.location.beans;

public interface L {
		public static final String DRIVER = "org.mariadb.jdbc.Driver";
		public static final String URL = "jdbc:mariadb://localhost:3306/mydb";
		public static final String USERID = "myuser";
		public static final String USERPW = "1234";

		public static final String SQL_Location_SELECT = 
				"SELECT * FROM shop";
		
		public static final String SQL_WRITE_SELECT_BY_LOC = 
				"SELECT * FROM shop WHERE sh_location_lat>=? and sh_location_lat<=? and sh_location_lng>=? and sh_location_lng<=?";
}
