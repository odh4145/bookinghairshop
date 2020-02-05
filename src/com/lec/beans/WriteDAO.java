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

public class WriteDAO {
   Connection conn;
   PreparedStatement pstmt;
   Statement stmt;
   ResultSet rs;

   // DAO 객체가 생성될때 Connection 도 생성된다!
   public WriteDAO() {

      try {
         Class.forName(D.DRIVER);
         conn = DriverManager.getConnection(D.URL, D.USERID, D.USERPW);
         System.out.println("WriteDAO 객체 생성, 데이터베이스 연결");
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

   // 새글 작성 <-- 제목, 내용, 작성자
   // INSERT 쓴 글을 DTO받아와서 매개변수로 넘겨주기
   public int insert(WriteDTO dto) throws SQLException {
      int use_uid = dto.getUse_uid();
      int sh_uid = dto.getSh_uid();
      String title = dto.getTitle();
      int star = dto.getStar();
      String content = dto.getContent();
      String name = dto.getName();

      return this.insert(use_uid, sh_uid, title, star, content, name);
   }

   public int insert(int use_uid, int sh_uid, String title, int star, String content, String name)
         throws SQLException {
      int cnt = 0;
   
      try {
         pstmt = conn.prepareStatement(D.SQL_WRITE_INSERT);
         pstmt.setInt(1, use_uid);
         pstmt.setInt(2, sh_uid);
         pstmt.setString(3, title);
         pstmt.setInt(4, star);
         pstmt.setString(5, content);
         pstmt.setString(6, name);
         System.out.println(name+title);
         cnt = pstmt.executeUpdate();
      } finally {
         close();
      }
      return cnt;
   }

   // ResultSet --> DTO 배열로 변환 리턴
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

   // 글 목록 읽어오기
   // SELECT
   public WriteDTO[] select() throws SQLException {
      WriteDTO[] arr = null;
      try {
         pstmt = conn.prepareStatement(D.SQL_WRITE_SELECT);
         rs = pstmt.executeQuery();
         arr = createArray(rs);
      } finally {
         close();
      }
      return arr;
   }

   //제목별 검색 기능
   public WriteDTO[] selectByTitle(int sh_uid,int from,int rows, String text) throws SQLException {
      WriteDTO [] arr = null;      
      try {
         pstmt = conn.prepareStatement(D.SQL_WRITE_SELECT_BY_TITLE);
         pstmt.setInt(1, sh_uid);
         pstmt.setString(2, "%"+text+"%");
         pstmt.setInt(3, from);
         pstmt.setInt(4, rows);
         rs = pstmt.executeQuery();
         arr = createArray(rs);
      } finally {
         close();
      }      
      return arr;
   }
   
   // 특정 uid 의 글만 읽어오기
   public WriteDTO[] selectByUid(int uid) throws SQLException {
      WriteDTO[] arr = null;

      try {
         pstmt = conn.prepareStatement(D.SQL_WRITE_SELECT_BY_UID);
         pstmt.setInt(1, uid);
         rs = pstmt.executeQuery();
         arr = createArray(rs);
      } finally {
         close();
      }

      return arr;
   }

   // 특정 uid 의 글만 읽어오기
   // SELECT, UPDATE
   public WriteDTO[] readByUid(int uid) throws SQLException {
      int cnt = 0;
      WriteDTO arr[] = null;

      try {
         // 트랜잭션 처리
         conn.setAutoCommit(false);

         // 쿼리문 실행

         pstmt = conn.prepareStatement(D.SQL_WRITE_SELECT_BY_UID);
         pstmt.setInt(1, uid);
         rs = pstmt.executeQuery();

         arr = createArray(rs);

         conn.commit();
      } catch (SQLException e) {
         conn.rollback();
         throw e;
      } finally {
         close();
      }

      return arr;
   }

   // 특정 uid 의 글을 삭제하기
   // DELETE
   public int deleteByUid(int uid) throws SQLException {
      int cnt = 0;

      try {
         pstmt = conn.prepareStatement(D.SQL_WRITE_DELETE_BY_UID);
         pstmt.setInt(1, uid);
         cnt = pstmt.executeUpdate();
      } finally {
         close();
      }

      return cnt;
   }

   // 특정 uid 의 글을 수정하기 --> 제목, 내용
   // UPDATE
   public int update(int uid, String title, String content) throws SQLException {
      int cnt = 0;
      try {
         pstmt = conn.prepareStatement(D.SQL_WRITE_UPDATE);
         pstmt.setString(1, title);
         pstmt.setString(2, content);
         pstmt.setInt(3, uid);
         cnt = pstmt.executeUpdate();
      } finally {
         close();
      }

      return cnt;
   }
   
   public int updateShop(int sh_uid) throws SQLException {
      int cnt = 0;
      try {
         pstmt = conn.prepareStatement(D.SQL_UPDATE_SHOPSTAR);
         pstmt.setInt(1, sh_uid);
         pstmt.setInt(2, sh_uid);
         cnt = pstmt.executeUpdate();
      } finally {
         close();
      }

      return cnt;
   }
   
   
   
   //////////////////////////페이징////////////////////////////////////////////////
   // 몇번째 from 부터 몇개  rows를 select할것인지 정하기
   public WriteDTO [] selectFromRowsh(int sh_uid, int from,int rows) throws SQLException{
      WriteDTO [] arr = null;      
      try {
         pstmt = conn.prepareStatement(D.SQL_SELECT_FROM_ROW_SH);
         pstmt.setInt(1, sh_uid);
         pstmt.setInt(2, from);
         pstmt.setInt(3, rows);
         rs = pstmt.executeQuery();
         arr = createArray(rs);
      } finally {
         close();
      }      
      return arr;
   }
   
   // 몇번째 from 부터 몇개  rows를 select할것인지 정하기
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
      
   
      
   // 총 몇개의 글이 있는지 계산
   public int countAll(int sh_uid) throws SQLException{
      int cnt = 0;
      // 결과값이 1x1행렬값이니까 int로 반환 하면 됨
      
      try {
         pstmt = conn.prepareStatement(D.SQL_COUNT_ALL);
         pstmt.setInt(1, sh_uid);
         rs = pstmt.executeQuery();
         rs.next(); // 첫번째 행으로 이동
         cnt = rs.getInt(1); // 첫번째 컬럼
         
      }finally {
         close();
      }   
      return cnt;
   }
   
   // 총 몇개의 글이 있는지 계산
   public int countSelectByTitle(int sh_uid,String text) throws SQLException{
      int cnt = 0;
      // 결과값이 1x1행렬값이니까 int로 반환 하면 됨
      
      try {
         pstmt = conn.prepareStatement(D.SQL_COUNT_SELECT_BY_TITLE);
         pstmt.setInt(1, sh_uid);
         pstmt.setString(2, "%"+text+"%");
         rs = pstmt.executeQuery();
         rs.next(); // 첫번째 행으로 이동
         cnt = rs.getInt(1); // 첫번째 컬럼
         
      }finally {
         close();
      }   
      return cnt;
   }
   
   public String SelectShopName(int sh_uid) throws SQLException{
      String cnt = "";
      // 결과값이 1x1행렬값이니까 int로 반환 하면 됨
      
      try {
         pstmt = conn.prepareStatement(D.SQL_SELECT_SHOPNAME);
         pstmt.setInt(1, sh_uid);
         rs = pstmt.executeQuery();
         rs.next(); // 첫번째 행으로 이동
         cnt = rs.getString(1); // 첫번째 컬럼
         
      }finally {
         close();
      }   
      return cnt;

   }
   
} // end class