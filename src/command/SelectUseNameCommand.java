package command;

import java.sql.SQLException;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.lec.beans.LogDAO;

public class SelectUseNameCommand implements Command {

   @Override
   public void execute(HttpServletRequest request, HttpServletResponse response) {
      // TODO Auto-generated method stub
      String cnt = ""; 
      LogDAO dao = new LogDAO();
      
      int use_uid = Integer.parseInt(request.getParameter("use_uid"));
      // Parameter 유효성 검증   
         try {
            cnt = dao.SelectUSEName(use_uid);
            
         }catch(SQLException e) {
            e.printStackTrace();
         }
            
      
      
      request.setAttribute("use_id", cnt);   
   }
}