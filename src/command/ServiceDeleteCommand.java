package command;

import java.sql.SQLException;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.info.beans.ServiceDAO;

public class ServiceDeleteCommand implements Command {

	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) {
		int cnt = 0;
		ServiceDAO dao = new ServiceDAO();

		int ser_uid = Integer.parseInt(request.getParameter("ser_uid"));
		int sh_uid = Integer.parseInt(request.getParameter("sh_uid"));

		try {
			cnt = dao.delete(ser_uid, sh_uid);
			request.setAttribute("service", cnt);
		} catch (SQLException e) {
			e.printStackTrace();
		}

	}

}
