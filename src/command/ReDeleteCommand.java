package command;

import java.sql.SQLException;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.lec.beans.ReplyDAO;

public class ReDeleteCommand implements Command {

	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) {
		int cnt = 0; 
		ReplyDAO dao = new ReplyDAO();
		int re_uid = Integer.parseInt(request.getParameter("re_uid"));
		
			try {
				cnt = dao.RedeleteByUid(re_uid);
				
			}catch(SQLException e) {
				e.printStackTrace();
			}
		request.setAttribute("RedeleteOk", cnt);
		
	}

}
