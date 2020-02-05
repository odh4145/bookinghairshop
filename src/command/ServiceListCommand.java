package command;

import java.sql.SQLException;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.info.beans.ServiceDAO;
import com.info.beans.ServiceDTO;

public class ServiceListCommand implements Command {

	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) {
		int sh_uid = Integer.parseInt(request.getParameter("sh_uid"));
		
		ServiceDAO dao = new ServiceDAO();
		ServiceDTO [] arr = null;
		
		if(sh_uid != 0) {
			try {
				arr = dao.list(sh_uid);
				request.setAttribute("service", arr);
			} catch(SQLException e) {
				e.printStackTrace();
			}			
		}
	}

}
