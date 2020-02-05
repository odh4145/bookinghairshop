package command;

import java.sql.SQLException;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.login.beans.ShopLoginDAO;
import com.login.beans.ShopLoginDTO;

public class ShopLoginCommand implements Command {

	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) {
		
		ShopLoginDAO dao = new ShopLoginDAO();
		ShopLoginDTO [] arr = null;
		
		String sh_id = request.getParameter("sh_id");
		String sh_pw = request.getParameter("sh_pw");
		
		if(sh_id != null && sh_pw != null &&
				sh_id.trim().length() > 0 && sh_pw.trim().length() > 0) {
			try {
				arr = dao.chkLogin(sh_id, sh_pw);
				for(int i = 0; i < arr.length; i++) {
					if(arr[i].getSh_id().equalsIgnoreCase(sh_id)) {
						if(arr[i].getSh_pw().equalsIgnoreCase(sh_pw)) {
							HttpSession session = request.getSession();
							session.setAttribute("shop", arr[i].getSh_uid());
							if(session.getAttribute("user") != null) {
								session.removeAttribute("user");
							}
							request.setAttribute("login_shop", 1);
						} else {
							request.setAttribute("login_shop", 0);
						}
					}
				}
				if(arr.length == 0) {
					request.setAttribute("login_shop", -1);
				}
			} catch(SQLException e) {
				e.printStackTrace();
			}
		}
	}
}
