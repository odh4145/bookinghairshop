package command;

import java.awt.image.BufferedImage;
import java.io.File;
import java.sql.SQLException;

import javax.imageio.ImageIO;
import javax.servlet.ServletContext;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.info.beans.DesignerDAO;
import com.oreilly.servlet.MultipartRequest;
import com.oreilly.servlet.multipart.DefaultFileRenamePolicy;
import com.oreilly.servlet.multipart.FileRenamePolicy;

public class DesignerUpdateCommand implements Command {

	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) {

		// 실제 저장되는 물리적인 경로 확인하기
		ServletContext context = request.getServletContext();
		String saveDirectory = context.getRealPath("img");
		System.out.println("업로드 경로: " + saveDirectory);

		String fileSystemName = null; // 실제 저장되는 파일 이름

		int maxPostSize = 5 * 1024 * 1024; // POST 받기, 최대 5M byte
		String encoding = "utf-8"; // response 인코딩
		FileRenamePolicy policy = new DefaultFileRenamePolicy(); // 업로딩 파일 이름 중복에 대한 정책

		MultipartRequest multi = null; // com.oreilly.servlet.MultipartRequest 임포트

		// MultipartRequest 객체 생성, 이미 저장되었다.
		try {
			multi = new MultipartRequest(request, saveDirectory, maxPostSize, encoding, policy);

			// 2. File 추출
			File file = multi.getFile("de_picture");
			if (file != null) {
				// 이미지 파일 다루기
				BufferedImage bi = ImageIO.read(file);
				if (bi == null) {
					System.out.println("이미지 파일이 아닙니다.");
				}
				bi.flush();
			}
		} catch (Exception e) {
			System.out.println("파일처리 예외 발생");
		}
		
		// <input type="file"> 의 name 가져오기

		// 실제 업로딩 된 파일 이름 (FileRenamePolicy 적용후)
		fileSystemName = multi.getFilesystemName("de_picture");
		System.out.println("파일시스템 이름: " + fileSystemName);

		// 파일 url, 나중에 link url 을 response 해줘야 한다
		String fullpath = saveDirectory + "\\" + fileSystemName;
		System.out.println(fullpath);
		
		int de_uid = Integer.parseInt(multi.getParameter("de_uid"));
		String de_name = multi.getParameter("de_name");
		String de_position = multi.getParameter("de_position");
		int de_career = Integer.parseInt(multi.getParameter("de_career"));
		String de_major = multi.getParameter("de_major");
		String de_picture = fileSystemName;
		
		DesignerDAO dao = new DesignerDAO();
		int cnt = 0;
		
		try {
			cnt = dao.update(de_uid, de_name, de_position, de_career, de_major, de_picture);
			request.setAttribute("designer", cnt);
		} catch(SQLException e) {
			e.printStackTrace();
		}
	}

}
