package com.change.beans;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;

public class ChangeShopDAO {
	Connection conn;
	PreparedStatement pstmt;
	Statement stmt;
	ResultSet rs;
	
	public ChangeShopDAO() {
		try {
			Class.forName(changeShopInterface.DRIVER);
			conn = DriverManager.getConnection(changeShopInterface.URL, changeShopInterface.USERID, changeShopInterface.USERPW);
		} catch(ClassNotFoundException e) {
			e.printStackTrace();
		} catch(SQLException e) {
			e.printStackTrace();
		}
	}
	
	// DB 자원 반납 메소드
	public void close() throws SQLException {
		if(rs != null) rs.close();
		if(pstmt != null) pstmt.close();
		if(stmt != null) stmt.close();
		if(conn != null) conn.close();
		System.out.println("DB 자원반납");
	}
	
	public ChangeShopDTO [] chkPw(ChangeShopDTO dto) throws SQLException {
		int sh_uid = dto.getSh_uid();
		String sh_pw = dto.getSh_pw();
		
		return this.chkPw(sh_uid, sh_pw);
	}
	
	public ChangeShopDTO [] chkPw(int sh_uid, String sh_pw) throws SQLException {
		ChangeShopDTO [] arr = null;
		
		try {
			pstmt = conn.prepareStatement(changeShopInterface.CHANGE_SHOP_INFO);
			pstmt.setInt(1, sh_uid);
			rs = pstmt.executeQuery();
			arr = createArray(rs);
		} finally {
			close();
		}
		
		return arr;
	}
	
	public ChangeShopDTO [] createArray(ResultSet rs) throws SQLException {
		ArrayList<ChangeShopDTO> list = new ArrayList<ChangeShopDTO>();
		
		while(rs.next()) {
			int sh_uid = rs.getInt("sh_uid");
			String sh_id = rs.getString("sh_id");
			String sh_pw = rs.getString("sh_pw");
			String sh_name = rs.getString("sh_name");
			
			ChangeShopDTO dto = new ChangeShopDTO(sh_uid, sh_id, sh_pw, sh_name);
			list.add(dto);
		}
		int size = list.size();
		ChangeShopDTO [] arr = new ChangeShopDTO[size];
		list.toArray(arr);
		return arr;
	}
	
	public int ChangeShopPw(int sh_uid, String sh_pw) throws SQLException {
		int cnt = 0;
		
		try {
			pstmt = conn.prepareStatement(changeShopInterface.CHANGE_SHOP_PW);
			pstmt.setString(1, sh_pw);
			pstmt.setInt(2, sh_uid);
			
			cnt = pstmt.executeUpdate();
			
		} finally {
			close();
		}
		
		return cnt;
	}
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
}
