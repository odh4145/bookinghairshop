package command;

import java.sql.SQLException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.Timer;
import java.util.TimerTask;
import com.book_show.beans.BookShopDAO;
import com.info.beans.BookDAO;

public class UpdateBookShopCommand implements Command{

   @Override
   public void execute(HttpServletRequest request, HttpServletResponse response) {
      BookShopDAO dao = new BookShopDAO();
      BookShopDAO dao_ser = new BookShopDAO();
      int cnt = 0;
      long diff = 0;
      int bo_uid = Integer.parseInt(request.getParameter("bo_uid").trim());
      String bo_service = request.getParameter("bo_service").trim();
      int sh_uid = Integer.parseInt(request.getParameter("sh_uid").trim());
      //날짜 (예약시간)
      String bo_time = request.getParameter("bo_time");
      
      //현재시간
      SimpleDateFormat form = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
      
      try {
         Date now = form.parse(form.format(new Date()));
         
         Date bo_time_form = form.parse(bo_time);
         diff = bo_time_form.getTime() - now.getTime();
         System.out.println(diff);
      } catch (ParseException e2) {
         e2.printStackTrace();
      }
      
      try {
         cnt=dao.update_stat(bo_uid);
         request.setAttribute("result", cnt);
      } catch (SQLException e) {
         e.printStackTrace();
      }
      
      
      try {
         //서비스 받는 시간
         int cnt_time = dao_ser.serviceTime(sh_uid, bo_service);
         //현재시간
         Timer k_timer = new Timer();
         // cnt_time 은 request에 담겨있는 시간을 받아와야 한다.--> service가 걸리는 시간을 
         
         TimerTask k_task = new TimerTask() {
            @Override
            public void run() {
               BookDAO dao_time = new BookDAO();
               try {
                  dao_time.update(bo_uid);
               } catch (SQLException e) {
                  e.printStackTrace();
               }
            }
         };
         
         k_timer.schedule(k_task, (1000 * 60 * cnt_time));
         
      }catch(SQLException e1) {
         e1.printStackTrace();
      }
   }

}