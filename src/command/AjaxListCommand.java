package command;

import java.io.IOException;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.jdom2.Document;
import org.jdom2.Element;
import org.jdom2.output.Format;
import org.jdom2.output.XMLOutputter;
import org.json.JSONArray;
import org.json.JSONObject;

import com.location.beans.LocDTO;

public class AjaxListCommand implements Command {

   @Override
   public void execute(HttpServletRequest request, HttpServletResponse response) {

      // parameter
      String reqType = request.getParameter("reqType");
      if(reqType == null) reqType = "json";   
      
      // "xml" 혹은 "json" 으로 response 하기
      switch(reqType) {
      
      case "json":
         responseJSON(request, response);
         break;
      default:
         responseJSON(request, response);         
      }
      
   }  // end execute()

   private void responseJSON(HttpServletRequest request, HttpServletResponse response) {
      
      LocDTO [] dtoArr = (LocDTO [])request.getAttribute("shoplist");
      
      JSONObject jsonOutput = new JSONObject();   // 최종 결과는 object
      
      // 데이터 개수
      int count = (dtoArr == null) ? 0 : dtoArr.length;
      jsonOutput.put("count", count);
      
      // 데이터 목록
      JSONArray dataArr = new JSONArray();
      
      for(int i = 0; i < count; i++) {
         JSONObject dataObj = new JSONObject();
         
         if(dtoArr[i].getSh_picture1()==null) {
            dataObj.put("pickture1","Default");
         }else {
            dataObj.put("pickture1", dtoArr[i].getSh_picture1());
         }
         
         
         dataObj.put("star", dtoArr[i].getSh_star());
         dataObj.put("telephone", dtoArr[i].getSh_telephone());
         dataObj.put("sh_uid", dtoArr[i].getSh_uid());
         dataObj.put("name", dtoArr[i].getSh_name());
         dataObj.put("location", dtoArr[i].getSh_location());
         dataObj.put("locationLat", dtoArr[i].getSh_location_lat());
         dataObj.put("locationLng", dtoArr[i].getSh_location_lng());
                  
         // array 에 추가
         dataArr.put(dataObj);
      }
      
      jsonOutput.put("datalist", dataArr);
      
      
      try {
         String jsonString = jsonOutput.toString();  // JSONObject 를 문자열로 변환
         System.out.println(jsonString);  // 테스트용
         
         response.setContentType("application/json; charset=utf-8");  // MIME 설정
         response.getWriter().write(jsonString);   // response 내보내기  ,  IOEXception
      } catch(IOException e) {
         e.printStackTrace();
      }
      
   }

   

   
   
   
   
   
}







