package command;

import java.sql.SQLException;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.lec.beans.ReplyDAO;
import com.lec.beans.ReplyDTO;

public class ReListCommand implements Command {

   @Override
   public void execute(HttpServletRequest request, HttpServletResponse response) {
      ReplyDAO dao = new ReplyDAO();
      ReplyDTO[] arr = null;
      int uid = Integer.parseInt(request.getParameter("uid"));
      
      try {
         arr = dao.ReselectByUid(uid);
         
         request.setAttribute("Relist", arr);

      } catch (SQLException e) {
         e.printStackTrace();
      }

   }

}