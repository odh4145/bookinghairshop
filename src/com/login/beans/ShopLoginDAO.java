package com.login.beans;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;

public class ShopLoginDAO {
	Connection conn;
	PreparedStatement pstmt;
	Statement stmt;
	ResultSet rs;
	
	// DB 연결
	public ShopLoginDAO() {
		try {
			Class.forName(ShopLoginInterface.DRIVER);
			conn = DriverManager.getConnection(ShopLoginInterface.URL, ShopLoginInterface.USERID, ShopLoginInterface.USERPW);
			System.out.println("ShopLoginDAO 객체 생성, 데이터베이스 연결");
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
		System.out.println("DB 자원 반납");
	}
	
	public ShopLoginDTO [] chkLogin(ShopLoginDTO dto) throws SQLException {
		String sh_id = dto.getSh_id();
		String sh_pw = dto.getSh_pw();
		
		return this.chkLogin(sh_id, sh_pw);
	} // end chkLogin(LoginDTO)
	
	public ShopLoginDTO [] chkLogin(String sh_id, String sh_pw) throws SQLException {
		ShopLoginDTO [] arr = null;
		
		try {
			pstmt = conn.prepareStatement(ShopLoginInterface.LOGIN_ID_SELECT);
			pstmt.setString(1, sh_id);
			rs = pstmt.executeQuery();
			System.out.println("쿼리문 실행");
			arr = createArray(rs);
			
		} finally {
			close();
		}
		
		return arr;
	} // end chkLogin(String, String)
	
	public ShopLoginDTO [] createArray(ResultSet rs) throws SQLException {
		ArrayList<ShopLoginDTO> list = new ArrayList<ShopLoginDTO>();
		
		while(rs.next()) {
			int sh_uid = rs.getInt("sh_uid");
			String sh_id = rs.getString("sh_id");
			String sh_pw = rs.getString("sh_pw");
			String sh_name = rs.getString("sh_name");
			
			ShopLoginDTO dto = new ShopLoginDTO(sh_uid, sh_id, sh_pw, sh_name);
			list.add(dto);
		} // end while()
		
		int size = list.size();
		ShopLoginDTO [] arr = new ShopLoginDTO[size];
		list.toArray(arr);
		return arr;
	} // end LoginDTO []
}
