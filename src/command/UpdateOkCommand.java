package command;

import java.sql.SQLException;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.lec.beans.WriteDAO;

public class UpdateOkCommand implements Command {

   @Override
   public void execute(HttpServletRequest request, HttpServletResponse response) {
      int cnt = 0; 
      WriteDAO dao = new WriteDAO();
      
      int uid = Integer.parseInt(request.getParameter("uid"));
      String title = request.getParameter("title");
      String content = request.getParameter("content");
      
      // Parameter 유효성 검증
      if ( title != null && title.trim().length()>0) {
         
         try {
            cnt = dao.update(uid, title, content);
            
         }catch(SQLException e) {
            e.printStackTrace();
         }
            
      }
      
      request.setAttribute("updateOk", cnt);
      
      
   }
   

}