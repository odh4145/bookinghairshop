package com.join.beans;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;

public class UserJoinDAO {
	Connection conn;
	PreparedStatement pstmt;
	Statement stmt;
	ResultSet rs;
	
	
	public UserJoinDAO() {
		try {
			Class.forName(UserJoinInterface.DRIVER);
			conn = DriverManager.getConnection(UserJoinInterface.URL, UserJoinInterface.USERID, UserJoinInterface.USERPW);
			System.out.println("JoinDAO 객체 생성, 데이터베이스 연결");
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
	
	// 손님 회원가입
	// 아이디, 비밀번호, 이름, 휴대폰번호
	// INSERT
	public int insert(UserJoinDTO dto) throws SQLException {
		String use_id = dto.getUse_id();
		String use_pw = dto.getUse_pw();
		String use_name = dto.getUse_name();
		String use_phoneNum = dto.getUse_phoneNum();
		
		return this.insert(use_id, use_pw, use_name, use_phoneNum);
	}

	public int insert(String use_id, String use_pw, String use_name, String use_phoneNum) throws SQLException {
		int cnt = 0;
		
		try {
			pstmt = conn.prepareStatement(UserJoinInterface.JOIN_USER_INSERT);
			pstmt.setString(1, use_id);
			pstmt.setString(2, use_pw);
			pstmt.setString(3, use_name);
			pstmt.setString(4, use_phoneNum);
			System.out.println("정보 저장");
			
			cnt = pstmt.executeUpdate();
		
		} finally {
			close();
		}
		
		System.out.println("insert() - cnt : " + cnt);
		return cnt;
	}



	public int chkID(String use_id) throws SQLException {
		int cnt = 0;
		int a = 0;
		int b = 0;
		
		try {
			pstmt = conn.prepareStatement(UserJoinInterface.JOIN_CHECK_ID);
			pstmt.setString(1, use_id);
			pstmt.setString(2, use_id);
			rs = pstmt.executeQuery();
			
			while(rs.next()) {
				a = rs.getInt(1);
				System.out.println(rs.getInt(1));
				b = rs.getInt(2);
				System.out.println(rs.getInt(2));
			}
			
			if(a == 0 && b == 0) {
				cnt = 1;
			} else {
				cnt = 0;
			}
			
		} finally {
			close();
		}
		
		System.out.println("chkID-cnt : " +cnt);
		return cnt;
	}
	
	public int chkNUM(String use_phoneNum) throws SQLException {
		int cnt = 0;
		int a = 0;
		int b = 0;
		
		try {
			pstmt = conn.prepareStatement(UserJoinInterface.JOIN_CHECK_PHONENUM);
			pstmt.setString(1, use_phoneNum);
			pstmt.setString(2, use_phoneNum);
			rs = pstmt.executeQuery();
			
			while(rs.next()) {
				a = rs.getInt(1);
				System.out.println(rs.getInt(1));
				b = rs.getInt(2);
				System.out.println(rs.getInt(2));
			}
			
			if(a == 0 && b == 0) {
				cnt = 1;
			} else {
				cnt = 0;
			}
		} finally {
			close();
		}
		
		System.out.println("chkNUM-cnt : " + cnt);
		return cnt;
	}
	
	
	
	
	
	
	
	
	
	
	
}
