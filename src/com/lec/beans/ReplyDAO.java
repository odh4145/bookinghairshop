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

public class ReplyDAO {
	Connection conn;
	PreparedStatement pstmt;
	Statement stmt;
	ResultSet rs;

	// DAO 객체가 생성될때 Connection 도 생성된다!
	public ReplyDAO() {

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

///////////////////////////////답글////////////////////////////
	
	public ReplyDTO[] createArray(ResultSet rs) throws SQLException {
		ArrayList<ReplyDTO> list = new ArrayList<ReplyDTO>();

		while (rs.next()) {
			int re_uid = rs.getInt("re_uid");
			int co_uid = rs.getInt("co_uid");
			String re_content = rs.getString("re_content");
			if (re_content == null)
				re_content = "";
			Date d = rs.getDate("re_regdate");
			Time t = rs.getTime("re_regdate");
			String re_regDate = new SimpleDateFormat("yyyy-MM-dd").format(d) + " "
					+ new SimpleDateFormat("hh:mm:ss").format(t);

			ReplyDTO dto = new ReplyDTO(re_uid, re_content, co_uid, re_regDate);
			list.add(dto);
		}

		int size = list.size();
		ReplyDTO[] arr = new ReplyDTO[size];
		list.toArray(arr);
		return arr;
	}
	
	
	
	public int Reinsert(ReplyDTO dto) throws SQLException {
		int co_uid = dto.getCo_uid();
		String re_content = dto.getRe_content();
		
		return this.Reinsert(co_uid,re_content);
	}

	public int Reinsert(int co_uid, String re_content) throws SQLException {
		int cnt = 0;

		try {
			pstmt = conn.prepareStatement(D.SQL_REPLY_INSERT);
			pstmt.setInt(1, co_uid);
			pstmt.setString(2, re_content);
			cnt = pstmt.executeUpdate();
		} finally {
			close();
		}
		return cnt;
	}

// 특정 uid 의 글만 읽어오기	
	public ReplyDTO[] ReselectByUid(int co_uid) throws SQLException {
		ReplyDTO[] arr = null;

		try {
			pstmt = conn.prepareStatement(D.SQL_REPLY_SELECT);
			pstmt.setInt(1, co_uid);
			rs = pstmt.executeQuery();
			arr = createArray(rs);
		} finally {
			close();
		}

		return arr;
	}

// DELETE
	public int RedeleteByUid(int re_uid) throws SQLException {
		int cnt = 0;

		try {
			pstmt = conn.prepareStatement(D.SQL_REPLY_DELETE_BY_UID);
			pstmt.setInt(1, re_uid);
			cnt = pstmt.executeUpdate();
		} finally {
			close();
		}

		return cnt;
	}

}// end Class
