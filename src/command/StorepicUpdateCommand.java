package command;

import java.awt.image.BufferedImage;
import java.io.File;
import java.sql.SQLException;
import java.util.Enumeration;

import javax.imageio.ImageIO;
import javax.servlet.ServletContext;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.info.beans.ShopDAO;
import com.oreilly.servlet.MultipartRequest;
import com.oreilly.servlet.multipart.DefaultFileRenamePolicy;
import com.oreilly.servlet.multipart.FileRenamePolicy;

public class StorepicUpdateCommand implements Command {
   
   @Override
   public void execute(HttpServletRequest request, HttpServletResponse response) {

      // 실제 저장되는 물리적인 경로 확인하기
      ServletContext context = request.getServletContext();
      String saveDirectory = context.getRealPath("img");
      System.out.println("업로드 경로: " + saveDirectory);

      String sh_picture1 = "", sh_picture2 = "", sh_picture3 =""; // 실제 저장되는 파일 이름
      String name = "";

      int maxPostSize = 5 * 1024 * 1024; // POST 받기, 최대 5M byte
      String encoding = "utf-8"; // response 인코딩
      FileRenamePolicy policy = new DefaultFileRenamePolicy(); // 업로딩 파일 이름 중복에 대한 정책

      MultipartRequest multi = null; // com.oreilly.servlet.MultipartRequest 임포트
               
      try {
         multi = new MultipartRequest(request, saveDirectory, maxPostSize, encoding, policy);
         Enumeration names = multi.getFileNames();
         
         while(names.hasMoreElements()){
            name = (String)names.nextElement();
            
         // 2. File 추출
            File file = multi.getFile(name);
            if (file != null) {
               // 이미지 파일 다루기
               BufferedImage bi = ImageIO.read(file);
               if (bi == null) {
                  System.out.println("이미지 파일이 아닙니다.");
               }
               bi.flush();
            }
            
            String fileSystemName = multi.getFilesystemName(name);
			String fullpath = saveDirectory + "\\" + fileSystemName;  
			
			switch(name) {
			case "sh_picture1":
				sh_picture1 = fileSystemName;
				System.out.println("sh_picture1 : " + fullpath);
				break;
				
			case "sh_picture2":
				sh_picture2 = fileSystemName;
				System.out.println("sh_picture2 : " + fullpath);
				break;
				
			case "sh_picture3":
				sh_picture3 = fileSystemName;
				System.out.println("sh_picture3 : " + fullpath);
				break;
			}
         }
      } catch (Exception e) {
         System.out.println("파일처리 예외 발생");
      }
      
      int sh_uid = Integer.parseInt(multi.getParameter("sh_uid"));
      ShopDAO dao = new ShopDAO();
      int cnt = 0;

      try {
    	  switch(name) {
			case "sh_picture1":
				cnt = dao.infopicupdate1(sh_uid, sh_picture1);
				break;
				
			case "sh_picture2":
				cnt = dao.infopicupdate2(sh_uid, sh_picture2);
				break;
				
			case "sh_picture3":
				cnt = dao.infopicupdate3(sh_uid, sh_picture3);
				break;
		 }
         request.setAttribute("info", cnt);
         request.setAttribute("sh_uid", sh_uid);
      } catch (SQLException e) {
         e.printStackTrace();
      }
   }

}