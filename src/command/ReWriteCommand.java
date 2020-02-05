package command;

import java.sql.SQLException;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.lec.beans.ReplyDAO;

public class ReWriteCommand implements Command {

   @Override
   public void execute(HttpServletRequest request, HttpServletResponse response) {
      int cnt = 0; 
      ReplyDAO dao = new ReplyDAO();
      
      int co_uid = Integer.parseInt(request.getParameter("uid"));
      String re_content = request.getParameter("re_content");
      int use_uid = Integer.parseInt(request.getParameter("use_uid"));
      // Parameter 유효성 검증
      if (use_uid==1) {
         
         try {
            cnt = dao.Reinsert(co_uid, re_content);
            
         }catch(SQLException e) {
            e.printStackTrace();
         }
            
      }else {
         System.out.println("로그인 미구현으로 인한 use_uid가 1이 아니면 답글 못달아 ~");
         cnt = 2; 
      }
      
      request.setAttribute("Reresult", cnt);
      request.setAttribute("co_uid", co_uid);
      
   }

}