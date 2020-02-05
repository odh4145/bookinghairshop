package command;

import java.sql.SQLException;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.info.beans.DesignerDAO;
import com.info.beans.DesignerDTO;

public class DesignerListCommand implements Command {

	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) {
		int sh_uid = Integer.parseInt(request.getParameter("sh_uid"));
		
		DesignerDAO dao = new DesignerDAO();
		DesignerDTO [] arr = null;
		
		if(sh_uid != 0) {
			try {
				arr = dao.list(sh_uid);
				request.setAttribute("designer", arr);
			} catch(SQLException e) {
				e.printStackTrace();
			}			
		}
	}

}
