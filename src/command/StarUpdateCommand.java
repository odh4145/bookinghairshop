package command;

import java.sql.SQLException;
import java.sql.Timestamp;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import com.book_show.beans.BookShopDAO;
import com.lec.beans.WriteDAO;

public class StarUpdateCommand implements Command {
	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) {
		WriteDAO dao = new WriteDAO();
		int cnt = 0;

		int sh_uid = Integer.parseInt(request.getParameter("sh_uid"));

		try {
			cnt=dao.updateStar(sh_uid);
			request.setAttribute("result", cnt);
		} catch (SQLException e) {
			e.printStackTrace();
		}
	}
}