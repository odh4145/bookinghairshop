package common;

/*
 * DB접속 정보, 쿼리문, 테이블명, 컬럼명 등은
 * 별도로 관리하든지
 * XML 등에서 관리하는 것이 좋다.
 */
public interface D {
   public static final String DRIVER = "org.mariadb.jdbc.Driver";
   public static final String URL = "jdbc:mariadb://localhost:3306/mydb";
   public static final String USERID = "myuser";
   public static final String USERPW = "1234";
   
   //////////////////////////////////////////////////// 게시글Comment 관련 쿼리문//////////////////////////////////////////////////////////
   
   // 매장 게시판"Comment테이블" 에 Insert 
   public static final String SQL_WRITE_INSERT = 
         "INSERT INTO comment"
         + "(use_uid,sh_uid,co_title, co_star, co_content, co_name) "
         + "VALUES"
         + "(?, ?, ?, ?, ? ,?)";
   
   
   public static final String SQL_WRITE_SELECT = 
         "SELECT * FROM comment ORDER BY co_uid DESC";
   
   public static final String SQL_WRITE_SELECT_BY_TITLE = 
         "SELECT * FROM comment WHERE sh_uid = ? and co_title like ? ORDER BY co_uid DESC LIMIT ?, ?";
   
   public static final String SQL_WRITE_SELECT_BY_UID = 
         "SELECT * FROM comment WHERE co_uid=?";
   
   
   public static final String SQL_WRITE_DELETE_BY_UID = 
         "DELETE FROM comment WHERE co_uid = ?";

   public static final String SQL_WRITE_UPDATE =
         "UPDATE comment SET co_title = ?, co_content = ? WHERE co_uid = ?";
   
   
   
   
   ////////////////////////////////////////////////리플
   // 매장 게시판"Comment테이블" 에 Insert 
   public static final String SQL_REPLY_INSERT = 
         "INSERT INTO reply"
         + "(co_uid, re_content) "
         + "VALUES"
         + "(?, ?)";
   
   //list
   public static final String SQL_REPLY_SELECT = 
         "SELECT * FROM reply WHERE co_uid = ? ORDER BY re_uid ASC";
   
   //delete
   public static final String SQL_REPLY_DELETE_BY_UID = 
         "DELETE FROM reply WHERE re_uid = ?";


   
   // 매장 정보 불러오기
   
   public static final String SQL_SELECT_SHOPNAME = 
         "SELECT sh_name FROM shop where sh_uid = ?";
   public static final String SQL_SELECT_USENAME = 
         "SELECT use_id FROM user where use_uid = ?";
   
   // 매장에 별점 변경하기 
   public static final String SQL_UPDATE_SHOPSTAR = 
         "UPDATE shop set sh_star=(select ROUND(avg(co_star),2) from comment where sh_uid=?) where sh_uid = ?";
   
   
   // 매장 페이징용 쿼리 준비
      // 쿼리: 글 목록 전체 개수 가져오기
      public static final String SQL_COUNT_ALL = 
            "SELECT COUNT(*) FROM comment WHERE sh_uid = ? ";
      public static final String SQL_COUNT_SELECT_BY_TITLE = 
            "SELECT COUNT(*) FROM comment WHERE sh_uid = ? and co_title like ?";
      
      // 쿼리: from 부터 row 만큼 SELECT : LIMIT 은 0 부터 시작 주의!
      public static final  String SQL_SELECT_FROM_ROW_SH = 
            "SELECT * FROM comment where sh_uid = ? ORDER BY co_uid DESC LIMIT ?, ?";
      public static final  String SQL_SELECT_FROM_ROW_USE = 
            "SELECT * FROM comment where use_uid = ? ORDER BY co_uid DESC LIMIT ?, ?";
      
   
} // end D


// INSERT INTO comment (use_uid,sh_uid,co_title, co_star, co_content, co_name) VALUES (1,1,'ㅎㅇ','4','NoJM,JMT','Hi');
//SELECT * FROM comment WHERE sh_uid = 1 and co_title like '%1%' ORDER BY co_uid DESC LIMIT 15, 8;