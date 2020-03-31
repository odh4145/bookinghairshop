package com.info.beans;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;

public class DesignerDAO {
	Connection conn;
	PreparedStatement pstmt;
	Statement stmt;
	ResultSet rs;

	// DAO 객체가 생성될때 Connection 도 생성된다!
	public DesignerDAO() {
		try {
			Class.forName(infoInterface.DRIVER);
			conn = DriverManager.getConnection(infoInterface.URL, infoInterface.USERID, infoInterface.USERPW);
			System.out.println("DesignerDAO 객체 생성, 데이터베이스 연결");
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
	public DesignerDTO[] createArray(ResultSet rs) throws SQLException {
		ArrayList<DesignerDTO> list = new ArrayList<DesignerDTO>();

		while (rs.next()) {
			int de_uid = rs.getInt("de_uid");
			String de_name = rs.getString("de_name");
			String de_position = rs.getString("de_position");
			int de_career = rs.getInt("de_career");
			String de_major = rs.getString("de_major");
			String de_picture = rs.getString("de_picture");
			int sh_uid = rs.getInt("sh_uid");

			DesignerDTO dto = new DesignerDTO(de_uid, de_name, de_position, de_career, de_major, de_picture, sh_uid);
			list.add(dto);
		}

		int size = list.size();
		DesignerDTO[] arr = new DesignerDTO[size];
		list.toArray(arr);
		return arr;
	}

	// 디자이너 추가
	public int insert(DesignerDTO dto) throws SQLException {
		int sh_uid = dto.getSh_uid();
		return this.insert(sh_uid);
	}

	public int insert(int sh_uid) 
			throws SQLException {
		int cnt = 0;

		try {
			pstmt = conn.prepareStatement(infoInterface.DESIGNER_INSERT);
			pstmt.setInt(1, sh_uid);
			cnt = pstmt.executeUpdate();
		} finally {
			close();
		}

		return cnt;
	}

	// 매장의 디자이너 목록 읽어오기
	public DesignerDTO[] list(int sh_uid) throws SQLException {
		DesignerDTO[] arr = null;
		try {
			pstmt = conn.prepareStatement(infoInterface.DESIGNER_SELECT_BY_SH_UID);
			pstmt.setInt(1, sh_uid);
			rs = pstmt.executeQuery();
			arr = createArray(rs);
		} finally {
			close();
		}
		return arr;
	}

	// 특정 디자이너 정보 불러오기
	public DesignerDTO[] select(int de_uid) throws SQLException {
		DesignerDTO[] arr = null;
		try {
			pstmt = conn.prepareStatement(infoInterface.DESIGNER_SELECT_BY_UID);
			pstmt.setInt(1, de_uid);
			rs = pstmt.executeQuery();
			arr = createArray(rs);
		} finally {
			close();
		}
		return arr;
	}

	// 디자이너정보 수정하기
	public int update(int de_uid, String de_name, String de_position, int de_career, String de_major,
			String de_picture) throws SQLException {
		int cnt = 0;
		try {
			pstmt = conn.prepareStatement(infoInterface.DESIGNER_UPDATE);
			pstmt.setString(1, de_name);
			pstmt.setString(2, de_position);
			pstmt.setInt(3, de_career);
			pstmt.setString(4, de_major);
			pstmt.setString(5, de_picture);
			pstmt.setInt(6, de_uid);
			cnt = pstmt.executeUpdate();
		} finally {
			close();
		}
		return cnt;
	}

	// 디자이너삭제
	public int delete(int de_uid) throws SQLException {
		int cnt = 0;
		try {
			pstmt = conn.prepareStatement(infoInterface.DESIGNER_DELETE);
			pstmt.setInt(1, de_uid);
			cnt = pstmt.executeUpdate();
		} finally {
			close();
		}
		return cnt;
	}
} // end class
