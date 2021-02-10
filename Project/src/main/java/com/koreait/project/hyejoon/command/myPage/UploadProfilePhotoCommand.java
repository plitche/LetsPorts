package com.koreait.project.hyejoon.command.myPage;

import java.io.File;
import java.util.HashMap;
import java.util.Map;

import javax.servlet.http.HttpSession;

import org.apache.ibatis.session.SqlSession;
import org.springframework.ui.Model;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.MultipartHttpServletRequest;

import com.koreait.project.common.CommonMapCommand;
import com.koreait.project.dto.UsersDto;
import com.koreait.project.hyejoon.dao.UsersDao;

public class UploadProfilePhotoCommand implements CommonMapCommand {

	@Override
	public Map<String, Object> execute(SqlSession sqlSession, Model model) {
		MultipartHttpServletRequest multipartRequest = (MultipartHttpServletRequest) model.asMap().get("multipartRequest");
		
		int user_no = Integer.parseInt(multipartRequest.getParameter("user_no"));
		MultipartFile file = multipartRequest.getFile("file");
		
		Map<String, Object> map = new HashMap<String, Object>();
		
		// 꺼낸 첨부가 있는지 검사
		if (file != null && !file.isEmpty()) {
			// MultipartFile file에서 첨부하는 파일명을 알아냅니다.
			String originalFilename = file.getOriginalFilename();
			// 확장자 (jpg 구하기)
			int pos = originalFilename.lastIndexOf(".");
			// 확장자 파일명.exe
			String extension = originalFilename.substring(pos + 1);
			// 업로드 할 파일명 만들기 (업로드시간.jpg)
			String uploadFilename = System.currentTimeMillis() + "." + extension;
			
			String realPath = multipartRequest.getServletContext().getRealPath("resources/storage/profile_photo");
			// 업로드 할 경로가 없으면 storage 디렉토리를 만듭니다.
			File dir = new File(realPath);
			if ( !dir.exists() ) {
				dir.mkdirs();
			}
			
			// 이제 업로드 할 파일명(uploadFilename)과 경로(realPath)를 모두 알고 있습니다.
			File uploadFile = new File(realPath, uploadFilename);
			// 첨부한 파일(MultipartFile file) -> 업로드 (uploadFile) 합니다.
			try {
				file.transferTo(uploadFile);
			} catch (Exception e) {
				e.printStackTrace();
			}
			
			// 테이블에 데이터를 저장합니다.
			UsersDao usersDao = sqlSession.getMapper(UsersDao.class);
			usersDao.userProfilePhotoUpdate(user_no, uploadFilename);  // 첨부가 있는 경우
			
			map.put("filename", uploadFilename);
		}
		
		UsersDto loginUser = sqlSession.getMapper(UsersDao.class).getUserSession(user_no);
		HttpSession session = multipartRequest.getSession();
		session.setAttribute("loginUser", loginUser);
		
		return map;
	}

}
