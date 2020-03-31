package command;

import java.sql.SQLException;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.info.beans.ServiceDAO;

public class ServiceAddCommand implements Command {

	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) {
		int cnt = 0;
		ServiceDAO dao = new ServiceDAO();
		
		try {		
			int sh_uid = Integer.parseInt(request.getParameter("sh_uid"));
			dao.toString();
			cnt = dao.insert(sh_uid);
			
			request.setAttribute("service", cnt);
		} catch (SQLException e) {
			e.printStackTrace();
		} catch (NumberFormatException e) {
			e.printStackTrace();
		}

	}

}
