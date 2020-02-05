package com.login.beans;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;


public class UserLoginDAO {
	Connection conn;
	PreparedStatement pstmt;
	Statement stmt;
	ResultSet rs;
	
	// DB 연결
	public UserLoginDAO() {
		try {
			Class.forName(UserLoginInterface.DRIVER);
			conn = DriverManager.getConnection(UserLoginInterface.URL, UserLoginInterface.USERID, UserLoginInterface.USERPW);
			System.out.println("UserLoginDAO 객체 생성, 데이터베이스 연결");
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
		System.out.println("DB 자원 반납");
	}
	
	public UserLoginDTO[] chkLogin(UserLoginDTO dto) throws SQLException{
		String use_id = dto.getUse_id();
		String use_pw = dto.getUse_pw();
		
		return this.chkLogin(use_id, use_pw);
	} // end chkLogin(LoginDTO)
	
	// 저장된 아이디 찾기
	public UserLoginDTO [] chkLogin(String use_id, String use_pw) throws SQLException{
		UserLoginDTO [] arr = null;
		
		try {
			pstmt = conn.prepareStatement(UserLoginInterface.LOGIN_ID_SELECT);
			pstmt.setString(1, use_id);
			rs = pstmt.executeQuery();
			System.out.println("쿼리문 실행");
			arr = createArray(rs);
			
		} finally {
			close();
		}
		
		return arr;

	} // end chkLogin(String, String)
	
	public UserLoginDTO [] createArray(ResultSet rs) throws SQLException {
		ArrayList<UserLoginDTO> list = new ArrayList<UserLoginDTO>();
		
			while(rs.next()) {
				int use_uid = rs.getInt("use_uid");
				String use_id = rs.getString("use_id");
				String use_pw = rs.getString("use_pw");
				String use_name = rs.getString("use_name");
				// String use_phoneNum = rs.getString("use_phoneNum");
				
				UserLoginDTO dto = new UserLoginDTO(use_uid, use_id, use_pw, use_name/*, use_phoneNum*/);
				list.add(dto);
			} // end while()
		
		int size = list.size();
		UserLoginDTO [] arr = new UserLoginDTO[size];
		list.toArray(arr);
		return arr;
	} // end LoginDTO []
}
