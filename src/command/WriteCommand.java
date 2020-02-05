package command;

import java.sql.SQLException;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.lec.beans.WriteDAO;

public class WriteCommand implements Command {

   @Override
   public void execute(HttpServletRequest request, HttpServletResponse response) {
      int cnt = 0; 
      int cnt2 = 0; 
      WriteDAO dao = new WriteDAO();
      
      int use_uid = Integer.parseInt(request.getParameter("use_uid"));
      int sh_uid = Integer.parseInt(request.getParameter("sh_uid"));
      String name =request.getParameter("name");
      String content = request.getParameter("content");
      String title =request.getParameter("title");
      int star = Integer.parseInt(request.getParameter("star"));
      
      // Parameter 유효성 검증
      if (name != null && title != null &&
            name.trim().length() > 0 && title.trim().length()>0) {
         
         try {
            cnt = dao.insert(use_uid, sh_uid, title, star, content, name);
            
            dao = new WriteDAO();
            
            cnt2 = dao.updateShop(sh_uid);
            
            
         }catch(SQLException e) {
            e.printStackTrace();
         }
            
      }
      
      request.setAttribute("result", cnt);
      request.setAttribute("cnt2", cnt2);
      request.setAttribute("sh_uid", sh_uid);
      
   }

}