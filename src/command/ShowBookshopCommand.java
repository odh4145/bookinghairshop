package command;

import java.sql.SQLException;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.book_show.beans.BookShopDAO;
import com.book_show.beans.BookShopDTO;
import com.info.beans.Command_k;

public class ShowBookshopCommand implements Command_k, Command {

	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) {
		BookShopDAO dao = new BookShopDAO();
		BookShopDTO [] arr = null;
		
		int sh_uid = Integer.parseInt(request.getParameter("sh_uid"));
		System.out.println("sh_uid = " + sh_uid);
		int page = 1;
		// 한 [페이징]에 몇개의 '페이지'를 표현할것인가?
		int writePages = 10;
		// 한 '페이지'에 몇개의 글을 리스트업 할 것인가?
		int pageRows = 8;
		// 총 몇 '페이지' 분량인가?
		int totalPage = 0;
		// 글은 총 몇개인가?
		int cnt = 0;
		String param = request.getParameter("page");
		if (param != null && !param.trim().equals("")) {
			try {
				page = Integer.parseInt(param);
			} catch (NumberFormatException e) {
			}
		}
		
		try {
			// 글 전체 갯수 구하기
			cnt = dao.countAll(sh_uid);
			
			//총 몇페이지 분량인가 
			totalPage = (int)Math.ceil(cnt/(double)pageRows); // Math.ceil << 나눠서 나머지 존재하면 올림    11.2 ==> 12
			
			// 몇번째 row부터 시작할것인가?
			int fromRow = (page - 1) * pageRows;
			
			dao = new BookShopDAO(); // 위에서 dao close()됫으니까 새로만들어서 한번더 동작시킴
			
			arr = dao.selectFromRow(sh_uid, fromRow, pageRows);
			System.out.println(page + " : " + totalPage + " : " + writePages + " : " + writePages + " : " + pageRows);
			request.setAttribute("book_sh", arr);
			request.setAttribute("page", page);
			request.setAttribute("totalPage", totalPage);
			request.setAttribute("writePages", writePages);
			request.setAttribute("pageRows", pageRows);
			request.setAttribute("sh_uid", sh_uid);
			/*
			 * arr = dao.select_by_use_uid(use_uid); request.setAttribute("book", arr);
			 */
		} catch (SQLException e) {
			e.printStackTrace();
		}
	}

}
