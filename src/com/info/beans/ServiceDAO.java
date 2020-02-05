package com.info.beans;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.sql.Time;
import java.text.SimpleDateFormat;
import java.util.ArrayList;

public class ServiceDAO {
	Connection conn;
	PreparedStatement pstmt;
	Statement stmt;
	ResultSet rs;

	// DAO 객체가 생성될때 Connection 도 생성된다!
	public ServiceDAO() {
		try {
			Class.forName(infoInterface.DRIVER);
			conn = DriverManager.getConnection(infoInterface.URL, infoInterface.USERID, infoInterface.USERPW);
			System.out.println("ServiceDAO 객체 생성, 데이터베이스 연결");
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

	// ResultSet --> DTO 배열로 변환 리턴
	public ServiceDTO[] createArray(ResultSet rs) throws SQLException {
		ArrayList<ServiceDTO> list = new ArrayList<ServiceDTO>();

		while (rs.next()) {
			int ser_uid = rs.getInt("ser_uid");
			String ser_name = rs.getString("ser_name");
			int ser_price = rs.getInt("ser_price");
			int ser_time = rs.getInt("ser_time");
			int sh_uid = rs.getInt("sh_uid");

			ServiceDTO dto = new ServiceDTO(ser_uid, ser_name, ser_price, ser_time, sh_uid);
			list.add(dto);
		}

		int size = list.size();
		ServiceDTO[] arr = new ServiceDTO[size];
		list.toArray(arr);
		return arr;
	}

	// 서비스 추가
	public int insert(ServiceDTO dto) throws SQLException {
		String ser_name = dto.getSer_name();
		int ser_price = dto.getSer_price();
		int ser_time = dto.getSer_time();
		int sh_uid = dto.getSh_uid();
		return this.insert(ser_name, ser_price, ser_time, sh_uid);
	}

	public int insert(String ser_name, int ser_price, int ser_time, int sh_uid)
					throws SQLException {
		int cnt = 0;

		try {
			pstmt = conn.prepareStatement(infoInterface.SERVICE_INSERT);
			pstmt.setString(1, ser_name);
			pstmt.setInt(2, ser_price);
			pstmt.setInt(3, ser_time);
			pstmt.setInt(4, sh_uid);
			cnt = pstmt.executeUpdate();
		} finally {
			close();
		}

		return cnt;
	}

	// 매장의 시술 목록 읽어오기
	public ServiceDTO[] list(int sh_uid) throws SQLException {
		ServiceDTO[] arr = null;
		try {
			pstmt = conn.prepareStatement(infoInterface.SERVICE_SELECT_BY_SH_UID);
			pstmt.setInt(1, sh_uid);
			rs = pstmt.executeQuery();
			arr = createArray(rs);
		} finally {
			close();
		}
		return arr;
	}

	// 특정 시술 정보 불러오기
	public ServiceDTO[] select(int ser_uid) throws SQLException {
		ServiceDTO[] arr = null;
		try {
			pstmt = conn.prepareStatement(infoInterface.SERVICE_SELECT_BY_UID);
			pstmt.setInt(1, ser_uid);
			rs = pstmt.executeQuery();
			arr = createArray(rs);
		} finally {
			close();
		}
		return arr;
	}

	// 시술정보 수정하기
	public int update(int ser_uid, String ser_name, int ser_price,
					int ser_time, int sh_uid) throws SQLException {
		int cnt = 0;
		try {
			pstmt = conn.prepareStatement(infoInterface.SERVICE_UPDATE);
			pstmt.setString(1, ser_name);
			pstmt.setInt(2, ser_price);
			pstmt.setInt(3, ser_time);
			pstmt.setInt(4, sh_uid);
			pstmt.setInt(5, ser_uid);
			cnt = pstmt.executeUpdate();
		} finally {
			close();
		}
		return cnt;
	}

	// 시술삭제
	public int delete(int ser_uid, int sh_uid) throws SQLException {
		int cnt = 0;
		try {
			pstmt = conn.prepareStatement(infoInterface.SERVICE_DELETE);
			pstmt.setInt(1, ser_uid);
			pstmt.setInt(2, sh_uid);
			cnt = pstmt.executeUpdate();
		} finally {
			close();
		}
		return cnt;
	}
} // end class
