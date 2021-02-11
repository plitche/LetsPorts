package com.koreait.project.hyejoon.command.myPage;

import java.io.File;
import java.util.HashMap;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.apache.ibatis.session.SqlSession;
import org.springframework.ui.Model;

import com.koreait.project.common.CommonMapCommand;
import com.koreait.project.dto.UsersDto;
import com.koreait.project.hyejoon.dao.UsersDao;

public class DeletePhotoCommand implements CommonMapCommand {

	@Override
	public Map<String, Object> execute(SqlSession sqlSession, Model model) {
		HttpServletRequest request = (HttpServletRequest) model.asMap().get("request");
		int user_no = (int) model.asMap().get("user_no");
		String filename = (String) model.asMap().get("filename");
		
		String realPath = request.getServletContext().getRealPath("resources/storage/profile_photo");
		File file = new File(realPath, filename);	// 파일클래스의 파일이라는 객체와 리얼패스안에 파일네임을 가진 파일을 연결시켜준다.
		if(file.exists()) {
			file.delete();
		}
		
		Map<String, Object> map = new HashMap<String, Object>();
		if(sqlSession.getMapper(UsersDao.class).userProfilePhotoBlankUpdate(user_no) > 0) { // 유저 프로필사진 칼럼을 null로 업데이트한다.
			map.put("result", true);
		} else {
			map.put("result", false);
		}
		
		// 세션에 저장
		UsersDto loginUser = sqlSession.getMapper(UsersDao.class).getUserSession(user_no);
		HttpSession session = request.getSession();
		session.setAttribute("loginUser", loginUser);
		
		return map;
	}

}
