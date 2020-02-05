package command;

import java.sql.SQLException;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.location.beans.LocDAO;
import com.location.beans.LocDTO;

public class LocationCommand implements Command {

	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) {
		LocDAO dao = new LocDAO();
		LocDTO [] arr = null;

		try {
			arr = dao.selectAllShop(); 
			request.setAttribute("shoplist", arr);
			arr.toString();
		} catch (SQLException e) { // 만약 ConnectionPool 을 사용한다면 여기서 NamingException 도 catch 해야 한다  
			e.printStackTrace();
		}
	}

}
