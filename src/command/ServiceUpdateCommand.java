package command;

import java.sql.SQLException;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.info.beans.ServiceDAO;

public class ServiceUpdateCommand implements Command {

	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) {
		int cnt = 0;
		ServiceDAO dao = new ServiceDAO();
		
		int ser_uid = Integer.parseInt(request.getParameter("ser_uid"));
		String ser_name = request.getParameter("ser_name");
		int ser_price = Integer.parseInt(request.getParameter("ser_price"));
		int ser_time = Integer.parseInt(request.getParameter("ser_time"));		
		int sh_uid = Integer.parseInt(request.getParameter("sh_uid"));

		try {
			cnt = dao.update(ser_uid, ser_name, ser_price, ser_time, sh_uid);
			dao.toString();
			request.setAttribute("service", cnt);
		} catch (SQLException e) {
			e.printStackTrace();
		}
	}

}
