package command;

import java.sql.SQLException;
import java.sql.Timestamp;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import com.book_show.beans.BookShopDAO;

public class UpdateBookShopCommand implements Command {
	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) {
		BookShopDAO dao = new BookShopDAO();
		int cnt = 0;

		int bo_uid = Integer.parseInt(request.getParameter("bo_uid"));
		String time = request.getParameter("bo_time");
		Timestamp bo_time = Timestamp.valueOf(time);

		try {
			cnt=dao.update_stat(bo_uid);
			request.setAttribute("result", cnt);
		} catch (SQLException e) {
			e.printStackTrace();
		}
	}
}