package command;

import java.sql.SQLException;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import com.book_show.beans.BookShopDAO;

public class BookStatUpdateCommand implements Command {
	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) {
		BookShopDAO dao = new BookShopDAO();
		int cnt = 0;

		try {
			cnt=dao.update_stat_time();
			request.setAttribute("result", cnt);
		} catch (SQLException e) {
			e.printStackTrace();
		}
	}
}