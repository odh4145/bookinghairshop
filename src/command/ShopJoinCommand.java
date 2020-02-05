package command;

import java.sql.SQLException;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.join.beans.ShopJoinDAO;
import com.join.beans.ShopJoinDTO;

public class ShopJoinCommand implements Command {

	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) {
		
		ShopJoinDAO dao = new ShopJoinDAO();
		ShopJoinDTO [] arr = null;
		int cnt = 0;
		int cnt1 = 0, cnt2 = 0, cnt3 = 0, cnt4 = 0;
		String location = null;
		
		
		// 입력한 값 받아오기
		String sh_id = request.getParameter("sh_id");
		String sh_pw = request.getParameter("sh_pw");
		String sh_no_id = request.getParameter("sh_no_id");
		String sh_name = request.getParameter("sh_name");
		String sh_telephone = request.getParameter("sh_telephone");
		String sh_location = request.getParameter("sh_location");
		String sh_location_lat = request.getParameter("sh_location_lat");
		String sh_location_lng = request.getParameter("sh_location_lng");
		
		System.out.println("입력한 값 받아오기 성공");
		
		// parameter 유효성 검증
		if(sh_id != null && sh_pw != null &&
			sh_no_id != null && sh_name != null &&
			sh_telephone != null && sh_location != null &&
			sh_location_lat !=null && sh_location_lng != null &&
			sh_id.trim().length() > 0 && sh_pw.trim().length() > 0 &&
			sh_no_id.trim().length() > 0 &&	sh_name.trim().length() > 0 &&
			sh_telephone.trim().length() > 0 &&	sh_location.trim().length() > 0 &&
			sh_location_lat.trim().length() > 0 && sh_location_lng.trim().length() > 0) {
			
			System.out.println("Parameter 검증 완료");
			try {
				cnt1 = dao.chkID(sh_id);
				if(cnt1 == 1) {
					dao = new ShopJoinDAO();
					cnt2 = dao.chkSH_NO_ID(sh_no_id);
					if(cnt2 == 1) {
						dao = new ShopJoinDAO();
						cnt3 = dao.chkTELEPHONE(sh_telephone);
						if(cnt3 == 1) {
							dao = new ShopJoinDAO();
							cnt =  dao.ShopJoin(sh_id, sh_pw, sh_no_id, sh_name, sh_telephone, sh_location, sh_location_lat, sh_location_lng);
						} // end if(cnt3)
					} // end if(cnt2)
				} // end if(cnt1)
			} catch(SQLException e) {
				e.printStackTrace();
			}
		} else {
			System.out.println("회원가입 실패");
		}
		
		if(cnt1 == 0) {
			request.setAttribute("join_shop", -2);
		} else if(cnt2 == 0) {
			request.setAttribute("join_shop", -1);
		} else if(cnt3 == 0) {
			request.setAttribute("join_shop", 0);
		} else {
			request.setAttribute("join_shop", cnt);
		}
	}
	
	

}
