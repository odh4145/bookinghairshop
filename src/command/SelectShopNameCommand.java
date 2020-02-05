package command;

import java.sql.SQLException;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.lec.beans.WriteDAO;

public class SelectShopNameCommand implements Command {

   @Override
   public void execute(HttpServletRequest request, HttpServletResponse response) {
      // TODO Auto-generated method stub
      String cnt = ""; 
      WriteDAO dao = new WriteDAO();
      
      int sh_uid = Integer.parseInt(request.getParameter("sh_uid"));
      // Parameter 유효성 검증   
         try {
            cnt = dao.SelectShopName(sh_uid);
            
         }catch(SQLException e) {
            e.printStackTrace();
         }
            
      
      
      request.setAttribute("shopName", cnt);   
   }
}