package command;

import java.sql.SQLException;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.info.beans.ShopDAO;
import com.info.beans.ShopDTO;

public class ShopCommand implements Command {

	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) {
		int sh_uid = Integer.parseInt(request.getParameter("sh_uid"));
		
		ShopDAO dao = new ShopDAO();
		ShopDTO [] arr = null;
		
		if(sh_uid != 0) {
			try {
				arr = dao.select(sh_uid);
				request.setAttribute("info", arr);
			} catch(SQLException e) {
				e.printStackTrace();
			}			
		}
	}

}
