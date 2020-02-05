package command;

import java.sql.SQLException;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.location.beans.LocDAO;
import com.location.beans.LocDTO;

public class MyLocationCommand implements Command {

		@Override
		public void execute(HttpServletRequest request, HttpServletResponse response) {
			LocDAO dao = new LocDAO();
			LocDTO [] arr = null;
			
			// 코드 잘못 수정되서 이걸로 다시 수정했어 
			// 머지할때 참고해 / sh_xxxx이거 아니고 lat lng값이어야함
			String loc_lat = (request.getParameter("lat"));  
			String loc_lng = (request.getParameter("lng"));
			
			System.out.println(" lat"+loc_lat);
			System.out.println(" lng"+loc_lng);
			try {
				arr = dao.selectByLoc(loc_lat, loc_lng); 
				request.setAttribute("shoplist", arr);
				arr.toString();
			} catch (SQLException e) { // 만약 ConnectionPool 을 사용한다면 여기서 NamingException 도 catch 해야 한다  
				e.printStackTrace();
			}
		} //end execute()

}
