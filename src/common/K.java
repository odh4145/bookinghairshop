package common;

public interface K {
	public static final String DRIVER = "org.mariadb.jdbc.Driver";
	public static final String URL = "jdbc:mariadb://localhost:3306/mydb";
	public static final String USERID = "myuser";
	public static final String USERPW = "1234";
	
	// BOOK 관련 쿼리문
	// 에약을 만들 때 
	public static final String SQL_BOOK_INSERT = 
			"INSERT INTO BOOK"
			+ "(bo_service, bo_time, bo_stat, use_id, sh_uid) "
			+ "VALUES"
			+ "(?, ?, ?, ?, ?)";

	// bo_uid 로 book 확인
	public static final String SQL_BOOK_SELECT_BY_BO_UID =
			"SELECT * FROM BOOK WHERE bo_uid = ?";
	// UPDATE --> stat (매장)
	public static final String SQL_BOOK_UPDATE_STAT_BY_SH_UID=
			"UPDATE BOOK SET bo_stat = 2 WHERE bo_uid = ?";
	// sh_uid로 book 확인
	public static final String SQL_BOOK_SELECT_BY_SHOP=
			"SELECT * FROM book WHERE sh_uid = ? ORDER BY bo_time DESC";
	// use_uid book 확인
	public static final String SQL_BOOK_JOIN_=
			"SELECT * FROM book b JOIN shop s ON b.sh_uid = s.sh_uid JOIN `user` u ON u.use_uid = b.use_uid WHERE b.use_uid = ? ORDER BY bo_time DESC";
	//DELETE
	public static final String SQL_BOOK_DELETE_BO_UID=
			"DELETE FROM BOOK WHERE bo_uid = ?";
	// UPDATE stat --> 시간이 지난경우 stat을 3으로
	public static final String SQL_BOOK_UPDATE_STAT_BY_BO_UID=
				"UPDATE BOOK SET bo_stat = 3 WHERE bo_uid = ?";
	// serviceTime가져오기
	public static final String SQL_BOOK_SERVICE_TIME = 
				"SELECT ser.ser_time FROM shop s JOIN service ser "
				+ "ON s.sh_uid = ser.sh_uid WHERE ser.ser_name = ? AND s.sh_uid = ?";
	// 페이징용 손님
	public static final String SQL_COUNT_ALL = 
			"SELECT COUNT(*) FROM book WHERE use_uid = ?";
	
	public static final  String SQL_SELECT_FROM_ROW = 
			"SELECT * FROM book b JOIN shop s ON b.sh_uid = s.sh_uid JOIN `user` u ON u.use_uid = b.use_uid WHERE b.use_uid = ? ORDER BY bo_uid desc LIMIT ?, ?";
	// 페이징용 매장
	public static final String SQL_COUNT_ALL_SHOP = 
			"SELECT COUNT(*) FROM book WHERE sh_uid = ?";
	
	public static final  String SQL_SELECT_FROM_ROW_SHOP = 
			"SELECT * FROM book b JOIN shop s ON b.sh_uid = s.sh_uid JOIN `user` u ON u.use_uid = b.use_uid WHERE b.sh_uid = ? ORDER BY bo_time DESC LIMIT ?, ?";
}
