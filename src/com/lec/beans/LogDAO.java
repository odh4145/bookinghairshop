package com.lec.beans;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.sql.Time;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;


import common.D;

public class LogDAO {
	Connection conn;
	PreparedStatement pstmt;
	Statement stmt;
	ResultSet rs;

	// DAO 객체가 생성될때 Connection 도 생성된다!
	public LogDAO() {

		try {
			Class.forName(D.DRIVER);
			conn = DriverManager.getConnection(D.URL, D.USERID, D.USERPW);
			System.out.println("ReplyDAO 객체 생성, 데이터베이스 연결");
		} catch (ClassNotFoundException e) {
			e.printStackTrace();
		} catch (SQLException e) {
			e.printStackTrace();
		}
	}

	// DB 자원 반납 메소드
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
	public WriteDTO[] createArray(ResultSet rs) throws SQLException {
		ArrayList<WriteDTO> list = new ArrayList<WriteDTO>();

		while (rs.next()) {
			int uid = rs.getInt("co_uid");
			int star = rs.getInt("co_star");
			String title = rs.getString("co_title");
			String name = rs.getString("co_name");
			String content = rs.getString("co_content");
			if (content == null)
				content = "";
			int use_uid = rs.getInt("use_uid");
			int sh_uid = rs.getInt("sh_uid");
			
			Date d = rs.getDate("co_regdate");
			Time t = rs.getTime("co_regdate");
			String regDate = new SimpleDateFormat("yyyy-MM-dd").format(d) + " "
					+ new SimpleDateFormat("hh:mm:ss").format(t);

			WriteDTO dto = new WriteDTO(uid, star, content, name, regDate, use_uid, sh_uid, title);
			list.add(dto);
		}
		int size = list.size();
		WriteDTO[] arr = new WriteDTO[size];
		list.toArray(arr);
		return arr;
	}
	
	public int countAll(int use_uid) throws SQLException{
		int cnt = 0;
		// 결과값이 1x1행렬값이니까 int로 반환 하면 됨
		
		try {
			pstmt = conn.prepareStatement(D.SQL_COUNT_ALL);
			pstmt.setInt(1, use_uid);
			rs = pstmt.executeQuery();
			rs.next(); // 첫번째 행으로 이동
			cnt = rs.getInt(1); // 첫번째 컬럼
			
		}finally {
			close();
		}	
		return cnt;
	}
	
	
	public WriteDTO [] selectFromRowuse(int use_uid, int from,int rows) throws SQLException{
		WriteDTO [] arr = null;		
		try {
			pstmt = conn.prepareStatement(D.SQL_SELECT_FROM_ROW_USE);
			pstmt.setInt(1, use_uid);
			pstmt.setInt(2, from);
			pstmt.setInt(3, rows);
			rs = pstmt.executeQuery();
			arr = createArray(rs);
		} finally {
			close();
		}		
		return arr;
	}
	
	public String SelectUSEName(int use_uid) throws SQLException{
		String cnt = "";
		// 결과값이 1x1행렬값이니까 int로 반환 하면 됨
		
		try {
			pstmt = conn.prepareStatement(D.SQL_SELECT_USENAME);
			pstmt.setInt(1, use_uid);
			rs = pstmt.executeQuery();
			rs.next(); // 첫번째 행으로 이동
			cnt = rs.getString(1); // 첫번째 컬럼
			
		}finally {
			close();
		}	
		return cnt;

	}
	
	
	
}
