package com.koreait.project.hyejoon.command.login;

import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.apache.ibatis.session.SqlSession;
import org.springframework.ui.Model;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.koreait.project.common.CommonVoidCommand;
import com.koreait.project.dto.UsersDto;
import com.koreait.project.hyejoon.dao.UsersDao;

public class UsersLoginCommand implements CommonVoidCommand {
	
	@Override
	public void execute(SqlSession sqlSession, Model model) {
		
		Map<String, Object> map = model.asMap();
		HttpServletRequest request = (HttpServletRequest) map.get("request");
		HttpSession session = request.getSession();
		RedirectAttributes redirect = (RedirectAttributes) map.get("redirect");
		
		String email = request.getParameter("email");
		String password = request.getParameter("password");
		
		// System.out.println(email + password);
		
		UsersDao usersDao = sqlSession.getMapper(UsersDao.class);
		UsersDto loginUser = usersDao.usersLogin(email, password);
		
		
		// login정보를 체크한다.
		// false:0, true:1 -> controller에도 연관되는 부분이므로 참고!
		if(loginUser == null) {
			// model.addAttribute("loginResult", 0); -> request 기반이니까 지워짐
			redirect.addFlashAttribute("loginResult", 0);
			// session에 정보 저장 안함!
		} else {
			// model.addAttribute("loginResult", 1);
			// true면 session에 저장!!
			redirect.addFlashAttribute("loginResult", 1);
			session.setAttribute("loginUser", loginUser);
		}
		
	}
	
}