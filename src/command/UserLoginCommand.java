package command;

import java.sql.SQLException;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.apache.catalina.ant.SessionsTask;

import com.login.beans.UserLoginDAO;
import com.login.beans.UserLoginDTO;

public class UserLoginCommand implements Command {

	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) {
		
		UserLoginDAO dao = new UserLoginDAO();
		UserLoginDTO [] arr = null;
		
		String use_id = request.getParameter("use_id");
		String use_pw = request.getParameter("use_pw");
		
		
		if(use_id != null && use_pw != null &&
				use_id.trim().length() > 0 && use_pw.trim().length() > 0) {
			try {
				arr = dao.chkLogin(use_id, use_pw);
				for(int i = 0; i < arr.length; i++) {
					if(arr[i].getUse_id().equalsIgnoreCase(use_id)) {
						if(arr[i].getUse_pw().equalsIgnoreCase(use_pw)) {
							HttpSession session = request.getSession();
							session.setAttribute("user", arr[i].getUse_uid());
							if(session.getAttribute("shop") != null) {
								session.removeAttribute("shop");
							}
							request.setAttribute("login_user", 1);
						} else {
							request.setAttribute("login_user", 0);
						}
					}
				}
				if(arr.length == 0) {
					request.setAttribute("login_user", -1);
				}
			} catch(SQLException e) {
				e.printStackTrace();
			}
		}
	}
}
