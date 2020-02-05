package command;

import java.sql.SQLException;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.lec.beans.WriteDAO;
import com.lec.beans.WriteDTO;

public class SorttingCommand implements Command {

   @Override
   public void execute(HttpServletRequest request, HttpServletResponse response) {
      // TODO Auto-generated method stub
      WriteDAO dao = new WriteDAO();
      WriteDTO[] arr = null;
      String text = request.getParameter("text");
      int sh_uid = Integer.parseInt(request.getParameter("sh_uid"));
      // 페이징 관련 세팅값들
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
      
      // 현재 몇페이지 인가? 페이지 값이 존재 하지 않는다면 1페이지 그대로 갈꺼임
      String param = request.getParameter("page");
      if (param != null && !param.trim().equals("")) {
         try {
         page = Integer.parseInt(param);
         }catch(NumberFormatException e){
            // 별도의 처리는 하지 않음   
            //param값이 인트가 아닐경우 익셉션 발생하니까 그거 잡아주기만 하기
         }
      }
      
      

      try {
         // 글 전체 갯수 구하기
         cnt = dao.countSelectByTitle(sh_uid, text);

         // 총 몇페이지 분량인가
         totalPage = (int) Math.ceil(cnt / (double) pageRows); // Math.ceil << 나눠서 나머지 존재하면 올림 11.2 ==> 12

         // 몇번째 row부터 시작할것인가?
         int fromRow = (page - 1) * pageRows;

         dao = new WriteDAO(); // 위에서 dao close()됫으니까 새로만들어서 한번더 동작시킴
         
         arr = dao.selectByTitle(sh_uid, fromRow, pageRows, text);
         
         request.setAttribute("list", arr);
         request.setAttribute("page", page);
         request.setAttribute("totalPage", totalPage);
         request.setAttribute("writePages", writePages);
         request.setAttribute("pageRows", pageRows);
         request.setAttribute("sh_uid", sh_uid);
         request.setAttribute("text", text);
         
      } catch (SQLException e) {
         e.printStackTrace();
      }

   
   }

}