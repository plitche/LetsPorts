package com.koreait.project.hyejoon.command;

import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.apache.ibatis.session.SqlSession;
import org.springframework.ui.Model;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

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
		RedirectAttributes redirect = (RedirectAttributes) map.get("redirect");
		
		UsersDao usersDao = sqlSession.getMapper(UsersDao.class);
		UsersDto loginUser = usersDao.usersLogin(usersDto);
		if(loginUser == null) {
			redirect.addFlashAttribute("loginResult", 1);
		} else {
			if(loginUser.getUser_separator() == 0) {
				session.setAttribute("loginUser", loginUser);
				redirect.addFlashAttribute("loginResult", 0);
			} else {
				redirect.addFlashAttribute("loginResult", 2);
			}
		}
		
	}
}
