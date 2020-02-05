package com.book_show.beans;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.sql.Time;
import java.sql.Timestamp;
import java.text.SimpleDateFormat;
import java.util.ArrayList;

import common.K;

public class BookShopDAO implements K {

	Connection conn;
	PreparedStatement pstmt;
	Statement stmt;
	ResultSet rs;

	// DAO 생성
	public BookShopDAO() {
		try {
			Class.forName(K.DRIVER);
			conn = DriverManager.getConnection(K.URL, K.USERID, K.USERPW);
			System.out.println("BookShopDAO생성 객체 생성, 데이터베이스 연결");
		} catch (ClassNotFoundException e) {
			e.printStackTrace();
		} catch (SQLException e) {
			e.printStackTrace();
		}
	}

	public void close() throws SQLException {
		if (rs != null)
			rs.close();
		if (pstmt != null)
			pstmt.close();
		if (stmt != null)
			stmt.close();
		if (conn != null)
			conn.close();
	}
	
	public BookShopDTO[] createArray(ResultSet rs) throws SQLException {
		ArrayList<BookShopDTO> list = new ArrayList<BookShopDTO>();

		while (rs.next()) {
			String bo_service = rs.getString("bo_service");
			
			int bo_uid = rs.getInt("bo_uid");
			int bo_stat = rs.getInt("bo_stat");
			int sh_uid = rs.getInt("sh_uid");
			Timestamp bo_time = rs.getTimestamp("bo_time");

			BookShopDTO dto = new BookShopDTO(bo_uid, bo_time, bo_service,
					bo_stat, sh_uid);
			list.add(dto);
		}
		int size = list.size();
		
		BookShopDTO[] arr = new BookShopDTO[size];
		list.toArray(arr);

		return arr;
	}
	// service time int로 바꾸는 메소드
		public int ser_time(ResultSet rs) throws SQLException{
				rs.first();
				Time ser_time = rs.getTime("ser_time");
				String service = new SimpleDateFormat("HH").format(ser_time);
				int ser_time_int = Integer.parseInt(service);
				System.out.println(ser_time);
				System.out.println(ser_time_int);
			
			return ser_time_int;
		}
	
	
	// 매장uid로 예약 확인
	public BookShopDTO[] select_by_shop (int shop_uid) throws SQLException{
		BookShopDTO[] arr = null;
		
		try {
			pstmt = conn.prepareStatement(K.SQL_BOOK_SELECT_BY_SHOP);
			pstmt.setInt(1, shop_uid);
			rs = pstmt.executeQuery();
			arr = createArray(rs);
			
		}finally {
			close();
		}
		return arr;
	};
	
	//stat 변경하기
	public int update_stat (int bo_uid) throws SQLException{
		int cnt = 0;
		try {
			pstmt = conn.prepareStatement(K.SQL_BOOK_UPDATE_STAT_BY_SH_UID);
			pstmt.setInt(1, bo_uid);
			cnt = pstmt.executeUpdate();
		} finally {
			close();
		}
		return cnt;
	}
	
	//service에서 시간가져오기
	public int serviceTime (int sh_uid, String name) throws SQLException{
		int arr = 0;
		try {
			pstmt = conn.prepareStatement(K.SQL_BOOK_SERVICE_TIME);
			pstmt.setString(1, name);
			pstmt.setInt(2, sh_uid);
			rs = pstmt.executeQuery();
			arr = ser_time(rs);
		} finally {}
		
		return arr;
		
	}
	
	//페이징 용 DAO
	// 총 몇개의 글이 있는지
	public int countAll(int sh_uid) throws SQLException{
		int cnt = 0;
		// 결과값이 1x1행렬값이니까 int로 반환 하면 됨
		
		try {
			pstmt = conn.prepareStatement(K.SQL_COUNT_ALL_SHOP);
			pstmt.setInt(1, sh_uid);
			rs = pstmt.executeQuery();
			rs.next(); // 첫번째 행으로 이동
			cnt = rs.getInt(1); // 첫번째 컬럼
			
		}finally {
			close();
		}
		return cnt;
	}
	
	// 몇번째 from 부터 몇개  rows를 select할것인지 정하기
			public BookShopDTO [] selectFromRow(int sh_uid ,int from, int rows) throws SQLException{
				BookShopDTO[] arr = null;
				System.out.println("sh_uid="  + sh_uid);
				System.out.println("from="  + from);
				System.out.println("rows="  + rows);
				try {
					pstmt = conn.prepareStatement(K.SQL_SELECT_FROM_ROW_SHOP);
					pstmt.setInt(1, sh_uid);
					pstmt.setInt(2, from);
					pstmt.setInt(3, rows);
					rs = pstmt.executeQuery();
					arr = createArray(rs);
					for (int i = 0; i < arr.length; i++) {
						arr[i].getBo_uid();
					}
				} finally {
					close();
				}
				
				return arr;
			}	
	
	
}
