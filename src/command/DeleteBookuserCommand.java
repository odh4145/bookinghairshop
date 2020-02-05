package command;

import java.sql.SQLException;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import com.info.beans.BookDAO;
import com.info.beans.Command_k;

public class DeleteBookuserCommand implements Command_k, Command{

	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) {
		BookDAO dao = new BookDAO();
		int cnt = 0;
		int bo_uid = Integer.parseInt(request.getParameter("bo_uid").trim());
		
		try {
			cnt=dao.delete(bo_uid);
			request.setAttribute("result", cnt);
		} catch (SQLException e) {
			e.printStackTrace();
		}
	}

}
