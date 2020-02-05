package command;

import java.sql.SQLException;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.book_show.beans.BookUserDAO;
import com.book_show.beans.BookUserDTO;

public class ShowBookuserCommand implements Command {

	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) {
		BookUserDAO dao = new BookUserDAO();
		BookUserDTO[] arr = null;
		int use_uid = Integer.parseInt(request.getParameter("use_uid"));
		String use_name = "" ;
		// 현재 페이지 나타내기 (디폴트 1page)
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
			cnt = dao.countAll(use_uid);
			
			//총 몇페이지 분량인가 
			totalPage = (int)Math.ceil(cnt/(double)pageRows); // Math.ceil << 나눠서 나머지 존재하면 올림    11.2 ==> 12
			
			// 몇번째 row부터 시작할것인가?
			int fromRow = (page - 1) * pageRows;
			
			dao = new BookUserDAO(); // 위에서 dao close()됫으니까 새로만들어서 한번더 동작시킴
			
			arr = dao.selectFromRow(use_uid, fromRow, pageRows);
			System.out.println(page + " : " + totalPage + " : " + writePages + " : " + writePages + " : " + pageRows);
			request.setAttribute("book", arr);
			request.setAttribute("page", page);
			request.setAttribute("totalPage", totalPage);
			request.setAttribute("writePages", writePages);
			request.setAttribute("pageRows", pageRows);
			request.setAttribute("use_uid", use_uid);
			request.setAttribute("use_name", use_name);
			/*
			 * arr = dao.select_by_use_uid(use_uid); request.setAttribute("book", arr);
			 */
		} catch (SQLException e) {
			e.printStackTrace();
		}
	}
}
