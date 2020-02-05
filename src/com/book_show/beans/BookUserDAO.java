package com.book_show.beans;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.sql.Time;
import java.sql.Timestamp;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;

import com.info.beans.BookDTO;

import common.K;

public class BookUserDAO implements K {

	
	Connection conn;
	PreparedStatement pstmt;
	Statement stmt;
	ResultSet rs;

	// DAO 생성
	public BookUserDAO() {

		try {
			Class.forName(K.DRIVER);
			conn = DriverManager.getConnection(K.URL, K.USERID, K.USERPW);
			System.out.println("BooKuserDAO 객체 생성, 데이터베이스 연결");
		} catch (ClassNotFoundException e) {
			System.out.println("BookUserDAO에서 Exception발생 확인");
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

	// ResultSet => BookUserDTO의 배열로 변환해서 보내주는 메소드
	public BookUserDTO[] createArray(ResultSet rs) throws SQLException {
		ArrayList<BookUserDTO> list = new ArrayList<BookUserDTO>();

		while (rs.next()) {

			String bo_service = rs.getString("bo_service");
			String sh_telephone = rs.getString("sh_telephone");
			String sh_location = rs.getString("sh_location");
			String bo_comment = rs.getString("bo_comment");
			String sh_name = rs.getString("sh_name");
			String use_name = rs.getString("use_name");
			int bo_uid = rs.getInt("bo_uid");
			int bo_stat = rs.getInt("bo_stat");
			int sh_uid = rs.getInt("sh_uid");
			int use_uid = rs.getInt("use_uid");
			Timestamp bo_time = rs.getTimestamp("bo_time");
			BookUserDTO dto =new BookUserDTO(bo_service, bo_time, bo_comment, sh_telephone, sh_location, sh_uid, bo_uid, use_uid, bo_stat, sh_name, use_name);
			list.add(dto);
		}
		int size = list.size();
		BookUserDTO[] arr = new BookUserDTO[size];
		list.toArray(arr);
		return arr;
	}
	
	
	// 예약확인하기 (user)
		public BookUserDTO[] select_by_use_uid(int use_uid) throws SQLException {
			BookUserDTO[] arr = null;

			try {
					pstmt = conn.prepareStatement(K.SQL_BOOK_JOIN_);
					pstmt.setInt(1, use_uid);
					rs = pstmt.executeQuery();
					arr = createArray(rs);
			} finally {
				close();
			}

			return arr;
		};
		
	// 페이징용 dao
	//총 몇개의 글이 있는지
		public int countAll(int use_uid) throws SQLException{
			int cnt = 0;
			// 결과값이 1x1행렬값이니까 int로 반환 하면 됨
			
			try {
				pstmt = conn.prepareStatement(K.SQL_COUNT_ALL);
				pstmt.setInt(1, use_uid);
				rs = pstmt.executeQuery();
				rs.next(); // 첫번째 행으로 이동
				cnt = rs.getInt(1); // 첫번째 컬럼
				
			}finally {
				close();
			}
			return cnt;
		}
		// 몇번째 from 부터 몇개  rows를 select할것인지 정하기
		public BookUserDTO [] selectFromRow(int use_uid ,int from, int rows) throws SQLException{
			BookUserDTO [] arr = null;
			
			try {
				pstmt = conn.prepareStatement(K.SQL_SELECT_FROM_ROW);
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
}


























