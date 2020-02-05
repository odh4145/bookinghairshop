package command;

import java.sql.SQLException;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.info.beans.BookDAO;
import com.info.beans.BookDTO;

public class SearchBookTimeCommand implements Command {

	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) {
		int sh_uid = Integer.parseInt(request.getParameter("sh_uid"));
		
		BookDAO dao = new BookDAO();
		BookDTO [] arr = null;
		
		if(sh_uid != 0) {
			try {
				arr = dao.searchBook(sh_uid);
				request.setAttribute("book", arr);
			} catch(SQLException e) {
				e.printStackTrace();
			}			
		}
	}

}
