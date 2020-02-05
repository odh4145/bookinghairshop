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

public class DesignerDeleteCommand implements Command {

	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) {

		// 실제 저장되는 물리적인 경로 확인하기
		ServletContext context = request.getServletContext();
		String saveDirectory = context.getRealPath("upload");

		int maxPostSize = 5 * 1024 * 1024; // POST 받기, 최대 5M byte
		String encoding = "utf-8"; // response 인코딩
		FileRenamePolicy policy = new DefaultFileRenamePolicy(); // 업로딩 파일 이름 중복에 대한 정책

		MultipartRequest multi = null; // com.oreilly.servlet.MultipartRequest 임포트

		// MultipartRequest 객체 생성, 이미 저장되었다.
		try {
			multi = new MultipartRequest(request, saveDirectory, maxPostSize, encoding, policy);
		} catch (Exception e) {
			System.out.println("파일처리 예외 발생");
		}


		int de_uid = Integer.parseInt(multi.getParameter("de_uid"));

		DesignerDAO dao = new DesignerDAO();
		int cnt = 0;

		try {
			cnt = dao.delete(de_uid);
			request.setAttribute("designer", cnt);
		} catch (SQLException e) {
			e.printStackTrace();
		}
	}

}
