package command;

import java.sql.SQLException;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.info.beans.DesignerDAO;

public class DesignerAddCommand implements Command {

	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) {
		int cnt = 0;
		DesignerDAO dao = new DesignerDAO();
		
		try {			
			String de_name = "이름";
			String de_position = "직책";
			int de_career = 0;
			String de_major = "전공";
			int sh_uid = Integer.parseInt(request.getParameter("sh_uid"));
			dao.toString();
			cnt = dao.insert(de_name, de_position, de_career, de_major, sh_uid);
			
			request.setAttribute("designer", cnt);
		} catch (SQLException e) {
			e.printStackTrace();
		} catch (NumberFormatException e) {
			e.printStackTrace();
		}

	}

}
