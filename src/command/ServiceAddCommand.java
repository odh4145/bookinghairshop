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
			
			String ser_name = "이름";
			int ser_price = 0;
			int ser_time = 0;
			int sh_uid = Integer.parseInt(request.getParameter("sh_uid"));
			dao.toString();
			cnt = dao.insert(ser_name, ser_price, ser_time, sh_uid);
			
			request.setAttribute("service", cnt);
		} catch (SQLException e) {
			e.printStackTrace();
		} catch (NumberFormatException e) {
			e.printStackTrace();
		}

	}

}
