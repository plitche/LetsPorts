package com.koreait.project.hyejoon.command.myPage;

import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.apache.ibatis.session.SqlSession;
import org.springframework.ui.Model;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.koreait.project.common.CommonVoidCommand;
import com.koreait.project.dto.UsersDto;
import com.koreait.project.hyejoon.dao.UsersDao;

public class UserInfoUpdatePwCheckCommand implements CommonVoidCommand {

	@Override
	public void execute(SqlSession sqlSession, Model model) {
		Map<String, Object> map = model.asMap();
		HttpServletRequest request = (HttpServletRequest) map.get("request");
		HttpSession session = request.getSession();
		RedirectAttributes redirect = (RedirectAttributes) map.get("redirect");
		
		String password = request.getParameter("password");
		
		UsersDao usersDao = sqlSession.getMapper(UsersDao.class);
		UsersDto updateUser = usersDao.infoUdatePwCheck(password);
		
		// login정보를 체크한다.
		// false:0, true:1 -> controller에도 연관되는 부분이므로 참고!
		if(updateUser == null) {
			// model.addAttribute("loginResult", 0); -> request 기반이니까 지워짐
			redirect.addFlashAttribute("updateUser", 0);
			// session에 정보 저장 안함!
		} else {
			// model.addAttribute("loginResult", 1);
			// true면 session에 저장!!
			redirect.addFlashAttribute("updateUser", 1);
			session.setAttribute("updateUser", updateUser);
		}
	}

}
