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
		HttpServletRequest request = (HttpServletRequest) map.get("request");
		String email = request.getParameter("email");
		String password = request.getParameter("password");

		UsersDao usersDao = sqlSession.getMapper(UsersDao.class);
		UsersDto loginUser2 = usersDao.usersLogin2(email, password);
		
		if (loginUser2 != null) {
			// 세션 올리게따
			model.addAttribute("loginResult", 0);
			model.addAttribute("loginUser2", loginUser2);
		} else {
			// 세션 안올리게따
			model.addAttribute("loginResult", 1);
		}
		
		
		UsersDto usersDto = (UsersDto) map.get("usersDto");
		RedirectAttributes redirect = (RedirectAttributes) map.get("redirect");
		HttpSession session = request.getSession();

		UsersDto loginUser = usersDao.usersLogin(usersDto);
		
		
		// login정보를 체크한다.
		if(loginUser == null) {
			model.addAttribute("loginResult", false);
			redirect.addFlashAttribute("loginResult");
		} else {
			model.addAttribute("loginResult", true);
			
			if(loginUser.getUser_separator() == 0) {
				// 로그인 상태 유지 위해 session에 저장한다.
				session.setAttribute("loginUser", loginUser);
				redirect.addAttribute("loginUser", 0);
				// 관리자 페이지로 넘겨준다.
			} else if(loginUser.getUser_separator() == 1) {
				session.setAttribute("loginUser", loginUser);
				redirect.addAttribute("loginUser", 1);
			} else {
				session.setAttribute("loginUser", loginUser);
				redirect.addAttribute("loginUser", 2);
			}
		}
		
		
	}
	
}
