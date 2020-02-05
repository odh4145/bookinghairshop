package com.change.beans;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;

public class DeleteShopDAO {
	Connection conn;
	PreparedStatement pstmt;
	Statement stmt;
	ResultSet rs;
	
	public DeleteShopDAO() {
		try {
			Class.forName(DeleteShopInterface.DRIVER);
			conn = DriverManager.getConnection(DeleteShopInterface.URL, DeleteShopInterface.USERID, DeleteShopInterface.USERPW);
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
	
	public int delete(DeleteShopDTO dto) throws SQLException {
		int sh_uid = dto.getSh_uid();
		String sh_pw = dto.getSh_pw();
		
		return this.delete(sh_uid, sh_pw);
	}

	public int delete(int sh_uid, String sh_pw) throws SQLException {
		int cnt = 0;
		
		try {
			pstmt = conn.prepareStatement(DeleteShopInterface.DELETE_SHOP);
			pstmt.setInt(1, sh_uid);
			cnt = pstmt.executeUpdate();
		} finally {
			close();
		}
		
		return cnt;
	}
	
	public DeleteShopDTO [] chkPw(int sh_uid, String sh_pw) throws SQLException {
		DeleteShopDTO [] arr = null;
		
		try {
			pstmt = conn.prepareStatement(DeleteShopInterface.DELETE_SHOP_INFO);
			pstmt.setInt(1, sh_uid);
			rs = pstmt.executeQuery();
			arr = createArray(rs);
		} finally {
			close();
		}
		
		return arr;
	}
	
	public DeleteShopDTO [] createArray(ResultSet rs) throws SQLException {
		ArrayList<DeleteShopDTO> list = new ArrayList<DeleteShopDTO>();
		
		while(rs.next()) {
			int sh_uid = rs.getInt("sh_uid");
			String sh_pw = rs.getString("sh_pw");
			
			DeleteShopDTO dto = new DeleteShopDTO(sh_uid, sh_pw);
			list.add(dto);
		}
		int size = list.size();
		DeleteShopDTO [] arr = new DeleteShopDTO[size];
		list.toArray(arr);
		return arr;
	}
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
}
