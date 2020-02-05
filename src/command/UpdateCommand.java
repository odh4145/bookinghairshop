package command;

import java.sql.SQLException;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.lec.beans.WriteDAO;
import com.lec.beans.WriteDTO;

public class UpdateCommand implements Command {

   @Override
   public void execute(HttpServletRequest request, HttpServletResponse response) {
      WriteDAO dao = new WriteDAO();
      WriteDTO [] arr = null;
      
      int uid = Integer.parseInt(request.getParameter("uid"));
      
      try {
         arr = dao.selectByUid(uid);
         
         request.setAttribute("update", arr);
         // request에 list라는 이름으로 arr을 담았다
         
      }catch(SQLException e){
         e.printStackTrace();
      }

   }
}