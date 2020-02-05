package com.change.beans;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;

public class DeleteUserDAO {
	Connection conn;
	PreparedStatement pstmt;
	Statement stmt;
	ResultSet rs;
	
	
	public DeleteUserDAO() {
		try {
			Class.forName(DeleteUserInterface.DRIVER);
			conn = DriverManager.getConnection(DeleteUserInterface.URL, DeleteUserInterface.USERID, DeleteUserInterface.USERPW);
			System.out.println("ChangeDAO 객체 생성, 데이터베이스 연결");
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
		System.out.println("DB 자원반납");
	}
	
	public int delete(DeleteUserDTO dto) throws SQLException {
		int use_uid = dto.getUse_uid();
		String use_pw = dto.getUse_pw();
		
		return this.delete(use_uid, use_pw);
	}
	
	public int delete(int use_uid, String use_pw) throws SQLException {
		int cnt = 0;
		
		try {
			pstmt = conn.prepareStatement(DeleteUserInterface.DELETE_USER);
			pstmt.setInt(1, use_uid);
			System.out.println("delete from user WHERE use_uid ="+use_uid);
			cnt = pstmt.executeUpdate();
		} finally {
			close();
		}
		
		return cnt;
	}
	
	public DeleteUserDTO [] chkPw(int use_uid, String use_pw) throws SQLException {
		DeleteUserDTO [] arr = null;
		
		try {
			pstmt = conn.prepareStatement(DeleteUserInterface.DELETE_USER_INFO);
			pstmt.setInt(1, use_uid);
			rs = pstmt.executeQuery();
			arr = createArray(rs);
		} finally {
			close();
		}
		return arr;
	}
	
	public DeleteUserDTO [] createArray(ResultSet rs) throws SQLException { 
		ArrayList<DeleteUserDTO> list = new ArrayList<DeleteUserDTO>();
		
		while(rs.next()) {
			int use_uid = rs.getInt("use_uid");
			String use_pw = rs.getString("use_pw");
			
			DeleteUserDTO dto = new DeleteUserDTO(use_uid, use_pw);
			list.add(dto);
		}
		int size = list.size();
		DeleteUserDTO [] arr = new DeleteUserDTO[size];
		list.toArray(arr);
		return arr;
		
	}
	
	
}
