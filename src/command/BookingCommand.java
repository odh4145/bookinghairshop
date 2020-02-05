package command;

import java.sql.SQLException;
import java.sql.Timestamp;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.info.beans.BookDAO;

public class BookingCommand implements Command {

	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) {
		int cnt = 0;
		BookDAO dao = new BookDAO();
		
		try {				
			String bo_service = request.getParameter("bo_service");
			String time = request.getParameter("bo_time");
			Timestamp bo_time = Timestamp.valueOf(time);
			int use_uid = Integer.parseInt(request.getParameter("use_uid"));
			int sh_uid = Integer.parseInt(request.getParameter("sh_uid"));

			cnt = dao.insert(bo_service, bo_time, use_uid, sh_uid);
			
			request.setAttribute("book", cnt);
			
		} catch (SQLException e) {
			e.printStackTrace();
		} catch (NumberFormatException e) {
			e.printStackTrace();
		}

	}

}
