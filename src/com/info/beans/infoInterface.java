package com.info.beans;

public interface infoInterface {
	public static final String DRIVER = "org.mariadb.jdbc.Driver";
	public static final String URL = "jdbc:mariadb://localhost:3306/mydb";
	public static final String USERID = "myuser";
	public static final String USERPW = "1234";
	
	// 매장 정보
	public static final String STORE_SELECT_BY_UID = 
			"SELECT * FROM SHOP WHERE sh_uid=?";
	
	// 매장기본정보 수정
	public static final String STORE_INFO_UPDATE = 
			"UPDATE SHOP SET "
			+ "sh_telephone = ?,"
			+ "sh_location = ?,"
			+ "sh_location_lat = ?,"
			+ "sh_location_lng = ?,"
			+ "sh_hello = ?,"
			+ "sh_starttime = ?,"
			+ "sh_endtime = ? "
			+ "WHERE sh_uid = ?";
	
	// 매장사진 수정
	public static final String STORE_PIC_UPDATE1 = 
			"UPDATE SHOP SET "
			+ "sh_picture1 = ?"
			+ "WHERE sh_uid = ?";
	public static final String STORE_PIC_UPDATE2 = 
			"UPDATE SHOP SET "
			+ "sh_picture2 = ?"
			+ "WHERE sh_uid = ?";
	public static final String STORE_PIC_UPDATE3 = 
			"UPDATE SHOP SET "
			+ "sh_picture3 = ?"
			+ "WHERE sh_uid = ?";
	
	// 디자이너 
	public static final String DESIGNER_INSERT = 
			"INSERT INTO DESIGNER"
			+ "(sh_uid)"
			+ "VALUES"
			+ "(?)";
	
	// 선택된 디자이너의 정보를 보기 위해
	public static final String DESIGNER_SELECT_BY_UID = 
			"SELECT * FROM DESIGNER WHERE de_uid= ?";
	
	// 매장별 디자이너 목록 보기위해
	public static final String DESIGNER_SELECT_BY_SH_UID = 
			"SELECT * FROM DESIGNER WHERE sh_uid= ?";
	
	public static final String DESIGNER_SELECT_PICTURE = 
			"SELECT de_picture FROM DESIGNER WHERE de_uid= ?";
	
	public static final String DESIGNER_DELETE = 
			"DELETE FROM DESIGNER WHERE de_uid = ?";

	public static final String DESIGNER_UPDATE =
			"UPDATE DESIGNER SET "
			+ "de_name = ?, "
			+ "de_position = ?, "
			+ "de_career = ?, "
			+ "de_major = ?, "
			+ "de_picture = ? "
			+ "WHERE de_uid = ?";
	
	// 시술목록
	public static final String SERVICE_INSERT = 
			"INSERT INTO SERVICE"
			+ "(sh_uid)"
			+ "VALUES"
			+ "(?)";
	
	public static final String SERVICE_SELECT_BY_UID =
			"SELECT * FROM SERVICE WHERE ser_uid= ?";
		
	public static final String SERVICE_SELECT_BY_SH_UID = 
			"SELECT * FROM SERVICE WHERE sh_uid= ?";
		
	public static final String SERVICE_DELETE = 
			"DELETE FROM SERVICE WHERE ser_uid = ? and sh_uid = ?";

	public static final String SERVICE_UPDATE =
			"UPDATE SERVICE SET "
			+ "ser_name = ?, "
			+ "ser_price = ?, "
			+ "ser_time = ?, "
			+ "sh_uid = ? "
			+ "WHERE ser_uid = ?";
	
	//예약하기
	public static final String BOOKING_INSERT =
			"INSERT INTO BOOK"
			+ "(bo_service, bo_time, use_uid, sh_uid)"
			+ "VALUES"
			+ "(?, ?, ?, ?)";
	
	//예약한 시간 가져오기
	public static final String SEARCH_BOOKTIME = 
			"SELECT * FROM book WHERE sh_uid = ?";
}


