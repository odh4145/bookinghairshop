package com.info.beans;

import java.sql.Connection;
import java.sql.Timestamp;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;

import java.util.ArrayList;

import common.K;

public class BookDAO implements K {

	Connection conn;
	PreparedStatement pstmt;
	Statement stmt;
	ResultSet rs;

	// DAO 생성
	public BookDAO() {

		try {
			Class.forName(K.DRIVER);
			conn = DriverManager.getConnection(K.URL, K.USERID, K.USERPW);
			System.out.println("BookDAO 객체 생성, 데이터베이스 연결");
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

	// ResultSet => DTO_book의 배열로 변환해서 보내주는 메소드
	public BookDTO[] createArray(ResultSet rs) throws SQLException {
		ArrayList<BookDTO> list = new ArrayList<BookDTO>();

		while (rs.next()) {
			int bo_uid = rs.getInt("bo_uid");
			int sh_uid = rs.getInt("sh_uid");
			int bo_stat = rs.getInt("bo_stat");
			String bo_comment = rs.getString("bo_comment");
			String bo_service = rs.getString("bo_service");
			int use_uid = rs.getInt("use_uid");
			Timestamp bo_time = rs.getTimestamp("bo_time");

			BookDTO dto = new BookDTO(bo_uid, bo_service, bo_stat, bo_time, bo_comment, use_uid, sh_uid);
			list.add(dto);
		}
		int size = list.size();
		BookDTO[] arr = new BookDTO[size];
		list.toArray(arr);

		return arr;
	}
	
	

	public int insert(BookDTO dto) throws SQLException {
		String bo_service = dto.getBo_service();
		Timestamp bo_time = dto.getBo_time();
		int use_uid = dto.getUse_uid();
		int sh_uid = dto.getSh_uid();

		return this.insert(bo_service, bo_time, use_uid, sh_uid);
	}

	// 예약하기
	public int insert(String bo_service, Timestamp bo_time, int use_uid, int sh_uid)
			throws SQLException {
		int cnt = 0;
		try {
			pstmt = conn.prepareStatement(infoInterface.BOOKING_INSERT);
			pstmt.setString(1, bo_service);
			pstmt.setTimestamp(2, bo_time);
			pstmt.setInt(3, use_uid);
			pstmt.setInt(4, sh_uid);
			cnt = pstmt.executeUpdate();
		} finally {
			close();
		}
		return cnt;
	}

	//예약 취소하기
		public int delete(int bo_uid) throws SQLException {
			int cnt = 0;
			try {
				pstmt = conn.prepareStatement(K.SQL_BOOK_DELETE_BO_UID);
				pstmt.setInt(1, bo_uid);
				cnt = pstmt.executeUpdate();
			} finally {
				close();
			}

			return cnt;
		};
		
	// 예약된 시간 찾기
		public BookDTO[] searchBook(int sh_uid) throws SQLException {
			BookDTO[] arr = null;
			try {
				pstmt = conn.prepareStatement(infoInterface.SEARCH_BOOKTIME);
				pstmt.setInt(1, sh_uid);
				rs = pstmt.executeQuery();
				arr = createArray(rs);
			} finally {
				close();
			}
			return arr;
		}

}



