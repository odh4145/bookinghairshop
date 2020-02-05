package command;

import java.sql.SQLException;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.change.beans.DeleteShopDAO;
import com.change.beans.DeleteShopDTO;

public class DeleteShop implements Command {

	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) {
		HttpSession session = request.getSession();
		
		DeleteShopDAO dao = new DeleteShopDAO();
		DeleteShopDTO [] arr = null;
		int cnt = 0;
		int sh_uid = 0;
		
		if(((Integer)(session.getAttribute("shop"))) == null) {
			sh_uid = 0;
		} else {
			sh_uid = ((Integer)(session.getAttribute("shop")));
		}
		
		String sh_pw = request.getParameter("sh_pw");
		
		if(sh_pw != null && sh_pw.trim().length() > 0) {
			try {
				arr = dao.chkPw(sh_uid, sh_pw);
				for (int i = 0; i < arr.length; i++) {
					
					if(arr[i].getSh_uid() == sh_uid) {
						dao = new DeleteShopDAO();
						if(arr[i].getSh_pw().equalsIgnoreCase(sh_pw)) {
							cnt = dao.delete(sh_uid, sh_pw);
						}
					}
				}
			} catch(SQLException e) {
				e.printStackTrace();
			}
		} else {
			System.out.println("회원탈퇴 실패");
		}
		
		if(cnt == 1) {
			request.setAttribute("deleteShop", cnt);
		} else {
			request.setAttribute("deleteShop", 0);
		}
		
	}

}
