package com.location.beans;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;


public class LocDAO {
   Connection conn;
   PreparedStatement pstmt;
   Statement stmt;
   ResultSet rs;

// DAO생성 + Connection생성 LocDAO()메소드   
public LocDAO() {
   try {
      Class.forName(L.DRIVER);
      conn = DriverManager.getConnection(L.URL,L.USERID,L.USERPW);
      System.out.println("locationDAO생성");
   } catch (ClassNotFoundException e) {
      
      e.printStackTrace();
   } catch (SQLException e) {
      
      e.printStackTrace();
   }
} 

//자원 반납용 close() 메소드
public void close() throws SQLException {
   if(rs != null) rs.close();
   if(pstmt != null) pstmt.close();
   if(stmt != null) stmt.close();
   if(conn != null) conn.close();
}

//ResultSet ---> DTO배열로 변환
// 매장의 정보를 받아와서 지도에 뿌려줘야함
public LocDTO[] createArray(ResultSet rs) throws SQLException{
   
   // 배열 size를 모르니까 ArrayList활용
   ArrayList<LocDTO> list = new ArrayList<LocDTO>();
   
   
   while(rs.next()){
      int sh_uid = rs.getInt("sh_uid");
      String sh_name = rs.getString("sh_name");
      String sh_telephone = rs.getString("sh_telephone");
      String sh_location = rs.getString("sh_location");
      String sh_location_lat = rs.getString("sh_location_lat");
      String sh_location_lng = rs.getString("sh_location_lng");
      double sh_star = rs.getDouble("sh_star");
      String sh_hello = rs.getString("sh_hello");
      String sh_picture1 = rs.getString("sh_picture1");
      String sh_picture2 = rs.getString("sh_picture2");
      String sh_picture3 = rs.getString("sh_picture3");
      
   
      int sh_starttime = rs.getInt("sh_starttime");
      int sh_endtime = rs.getInt("sh_endtime");
      
      LocDTO dto = new LocDTO(sh_uid, sh_name, sh_telephone, sh_location, sh_location_lat, sh_location_lng, sh_hello, sh_star, sh_picture1, sh_picture2, sh_picture3, sh_starttime, sh_endtime);
      
      list.add(dto);
      
   }
   int size = list.size();
   
   LocDTO [] arr = new LocDTO[size];
   list.toArray(arr);
   return arr;
}


//주변의 매장정보를 읽어오기 
public LocDTO[] select() throws SQLException {
   LocDTO[] arr = null;
   try{
      pstmt = conn.prepareStatement(L.SQL_Location_SELECT);
      rs = pstmt.executeQuery();
   arr = createArray(rs);
   
   }finally {
      close();
   }
   return arr;
}


//주변의 가게 정보 받아오기   
public LocDTO[] selectByLoc(String loc_lat,String loc_lng) throws SQLException{
   LocDTO[] arr = null;
   double d_lng = Double.parseDouble(loc_lng);
   double d_lat = Double.parseDouble(loc_lat);
   
   try {
      pstmt = conn.prepareStatement(L.SQL_WRITE_SELECT_BY_LOC);
      pstmt.setDouble(1, d_lat-0.08);
      pstmt.setDouble(2, d_lat+0.08);
      pstmt.setDouble(3, d_lng-0.08);
      pstmt.setDouble(4, d_lng+0.08);
      rs = pstmt.executeQuery();
      arr = createArray(rs);
      
      
   }finally {
      close();
   }   
   return arr;
}

//주변의 가게 정보 받아오기 지도초기화시 전체 나타내는용

public LocDTO[] selectAllShop() throws SQLException{
   LocDTO[] arr = null;
   
   try {
      pstmt = conn.prepareStatement(L.SQL_Location_SELECT);
      rs = pstmt.executeQuery();
      arr = createArray(rs);
   }finally {
      close();
   }   
   return arr;
}


}// end Class