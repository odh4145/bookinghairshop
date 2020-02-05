package command;

import java.sql.SQLException;

import javax.security.auth.message.callback.PrivateKeyCallback.Request;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.change.beans.ChangeShopDAO;
import com.change.beans.ChangeShopDTO;

public class ChangeShopInfoCommand implements Command {

	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) {

		HttpSession session = request.getSession();
		
		ChangeShopDAO dao = new ChangeShopDAO();
		ChangeShopDTO [] arr = null;
		int cnt = 0;
		int sh_uid = 0;
		
		if(((Integer)(session.getAttribute("shop"))) == null) {
			sh_uid = 0;
		} else {
			sh_uid = ((Integer)(session.getAttribute("shop")));
		}
		
		String sh_pw = request.getParameter("sh_pw");
		String sh_pw2 = request.getParameter("sh_pw2");
		
		if(sh_pw != null && sh_pw2 != null
				&& sh_pw.trim().length() > 0 && sh_pw2.trim().length() > 0) {
			
			try {
				arr = dao.chkPw(sh_uid, sh_pw);
				for (int i = 0; i < arr.length; i++) {
					if(arr[i].getSh_uid() == sh_uid) {
						dao = new ChangeShopDAO();
						if(arr[i].getSh_pw().equalsIgnoreCase(sh_pw)) {
							cnt = dao.ChangeShopPw(sh_uid, sh_pw2);
						}
					}
				}
			} catch(SQLException e) {
				e.printStackTrace();
			}
		} else {
			System.out.println("비밀번호 변경 실패");
		}
		
		if(cnt == 1) {
			request.setAttribute("change_shop_info", 1);
		} else {
			request.setAttribute("change_shop_info", 0);
		}
	}
}
