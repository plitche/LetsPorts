package com.koreait.project.hyejoon.command;

import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.apache.ibatis.session.SqlSession;
import org.springframework.ui.Model;

import com.koreait.project.common.CommonVoidCommand;
import com.koreait.project.hyejoon.dao.UsersDao;
import com.koreait.project.hyejoon.dto.UsersDto;

public class UsersLoginCommand implements CommonVoidCommand {
	
	@Override
	public void execute(SqlSession sqlSession, Model model) {
		Map<String, Object> map = model.asMap();
		UsersDto usersDto = (UsersDto) map.get("usersDto");
		HttpServletRequest request = (HttpServletRequest) map.get("request");
		HttpSession session = request.getSession();
		
		UsersDao usersDao = sqlSession.getMapper(UsersDao.class);
		UsersDto loginUser = usersDao.usersLogin(usersDto);
		
		
		// user_id를 캐스팅하라 한 부분,,, userid라는 파라미터는 어디서 나온건지 몰라서 헤매는 중이여 용수님 ㅠㅠ
		int user_no = Integer.parseInt(request.getParameter("user_no"));
		String password = request.getParameter("password");
		
		session.setAttribute("user_no", usersDto);
		session.setAttribute("password", usersDto);
		
	}
}
