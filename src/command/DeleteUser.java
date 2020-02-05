package command;

import java.sql.SQLException;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.change.beans.DeleteUserDAO;
import com.change.beans.DeleteUserDTO;

public class DeleteUser implements Command {

	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) {
		
		HttpSession session = request.getSession();
		
		DeleteUserDAO dao = new DeleteUserDAO();
		DeleteUserDTO [] arr = null;
		int cnt = 0;
		int use_uid = 0;
		
		if(((Integer)(session.getAttribute("user"))) == null) {
			use_uid = 0;
		} else {
			use_uid = ((Integer)(session.getAttribute("user")));
		}
		
		String use_pw = request.getParameter("use_pw");
		
		if(use_pw != null && use_pw.trim().length() > 0) {
			try {
				arr = dao.chkPw(use_uid, use_pw);
				for(int i = 0; i < arr.length; i++) {
					if(arr[i].getUse_uid() == use_uid) {
						dao = new DeleteUserDAO();
						if(arr[i].getUse_pw().equalsIgnoreCase(use_pw)) {
							cnt = dao.delete(use_uid, use_pw);
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
			request.setAttribute("deleteUser", cnt);
		} else {
			request.setAttribute("deleteUser", 0);
		}
	}

}
