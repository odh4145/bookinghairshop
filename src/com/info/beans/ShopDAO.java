package com.info.beans;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;

public class ShopDAO {
	Connection conn;
	PreparedStatement pstmt;
	Statement stmt;
	ResultSet rs;
	
	// DAO 객체가 생성될때 Connection 도 생성된다!
	public ShopDAO() {
		try {
			Class.forName(infoInterface.DRIVER);
			conn = DriverManager.getConnection(infoInterface.URL, infoInterface.USERID, infoInterface.USERPW);
			System.out.println("ShopDAO 객체 생성, 데이터베이스 연결");
		} catch (ClassNotFoundException e) {
			e.printStackTrace();
		} catch (SQLException e) {
			e.printStackTrace();
		}
	}
	
	// DB 자원 반납 메소드
	public void close() throws SQLException {
		if(rs != null) rs.close();
		if(pstmt != null) pstmt.close();
		if(stmt != null) stmt.close();
		if(conn != null) conn.close();
	}
	
	// ResultSet --> DTO 배열로 변환 리턴
	public ShopDTO [] createArray(ResultSet rs) throws SQLException {
		ArrayList<ShopDTO> list = new ArrayList<ShopDTO>();
		
		while(rs.next()){
			int sh_uid = rs.getInt("sh_uid");
			String sh_name = rs.getString("sh_name");
			String sh_telephone = rs.getString("sh_telephone");
			String sh_location = rs.getString("sh_location");
			String sh_hello = rs.getString("sh_hello");
			String sh_picture1 = rs.getString("sh_picture1");
			String sh_picture2 = rs.getString("sh_picture2");
			String sh_picture3 = rs.getString("sh_picture3");
			int sh_starttime = rs.getInt("sh_starttime");
			int sh_endtime = rs.getInt("sh_endtime");
			String sh_location_lat = rs.getString("sh_location_lat");
			String sh_location_lng = rs.getString("sh_location_lng");
			
			ShopDTO dto = new ShopDTO(sh_uid, sh_name, sh_telephone, sh_location, sh_hello, 
						sh_picture1, sh_picture2, sh_picture3, sh_starttime, sh_endtime, sh_location_lat, sh_location_lng);
			list.add(dto);			
		}
		
		int size = list.size();
		ShopDTO [] arr = new ShopDTO[size];
		list.toArray(arr);
		return arr;
	}
	
	// 매장정보 읽어오기 
	public ShopDTO [] select(int sh_uid) throws SQLException {
		ShopDTO [] arr = null;
		try {			
			pstmt = conn.prepareStatement(infoInterface.STORE_SELECT_BY_UID);
			pstmt.setInt(1, sh_uid);
			rs = pstmt.executeQuery();
			arr = createArray(rs);
		} finally {
			close();
		}			
		return arr;
	}
	
	// 매장사진 수정하기
	public int infopicupdate(int sh_uid, String sh_picture1, String sh_picture2, String sh_picture3) throws SQLException{
		int cnt = 0;
		try {
			pstmt = conn.prepareStatement(infoInterface.STORE_PIC_UPDATE);
			pstmt.setString(1, sh_picture1);
			pstmt.setString(2, sh_picture2);
			pstmt.setString(3, sh_picture3);
			pstmt.setInt(4, sh_uid);
			cnt = pstmt.executeUpdate();
		} finally {
			close();
		}
		return cnt;
	}
	
	// 매장정보 수정하기
		public int infoupdate(int sh_uid, String sh_telephone, String sh_location, String sh_hello, 
							int sh_starttime, int sh_endtime, String sh_location_lat, String sh_location_lng) throws SQLException{
			int cnt = 0;
			try {
				pstmt = conn.prepareStatement(infoInterface.STORE_INFO_UPDATE);
				pstmt.setString(1, sh_telephone);
				pstmt.setString(2, sh_location);
				pstmt.setString(3, sh_location_lat);
				pstmt.setString(4, sh_location_lng);
				pstmt.setString(5, sh_hello);
				pstmt.setInt(6, sh_starttime);
				pstmt.setInt(7, sh_endtime);
				pstmt.setInt(8, sh_uid);
				cnt = pstmt.executeUpdate();
			} finally {
				close();
			}
			return cnt;
		}
} // end class






