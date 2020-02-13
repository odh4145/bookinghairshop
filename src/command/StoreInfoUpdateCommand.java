package command;

import java.sql.SQLException;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.info.beans.ShopDAO;

public class StoreInfoUpdateCommand implements Command {

	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) {
		int cnt = 0;
		ShopDAO dao = new ShopDAO();
		
		String sh_telephone = request.getParameter("sh_telephone");
		String sh_location = request.getParameter("sh_location");
		String sh_hello = request.getParameter("sh_hello").trim();
		int sh_starttime = Integer.parseInt(request.getParameter("sh_starttime"));		
		int sh_endtime = Integer.parseInt(request.getParameter("sh_endtime"));
		int sh_uid = Integer.parseInt(request.getParameter("sh_uid"));
		String sh_location_lat = request.getParameter("sh_location_lat");
		String sh_location_lng = request.getParameter("sh_location_lng");

		try {
			cnt = dao.infoupdate(sh_uid, sh_telephone, sh_location, sh_hello, sh_starttime, sh_endtime, sh_location_lat, sh_location_lng);
			request.setAttribute("info", cnt);
		} catch (SQLException e) {
			e.printStackTrace();
		}
	}

}
