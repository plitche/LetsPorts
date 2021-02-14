package com.koreait.project.hyejoon.command.userAccount;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.apache.ibatis.session.SqlSession;
import org.springframework.ui.Model;

import com.koreait.project.common.CommonVoidCommand;
import com.koreait.project.dto.UsersDto;
import com.koreait.project.hyejoon.dao.UsersDao;
import com.koreait.project.hyejoon.dao.WookiClientDao;
import com.koreait.project.hyejoon.dto.UserUpdateDto;

public class UserUpdateCommand implements CommonVoidCommand {

	@Override
	public void execute(SqlSession sqlSession, Model model) {
		UserUpdateDto userUpdateDto = (UserUpdateDto) model.asMap().get("userUpdateDto");
		HttpServletRequest request = (HttpServletRequest) model.asMap().get("request");
		WookiClientDao wookiClientDao = sqlSession.getMapper(WookiClientDao.class);
		
		wookiClientDao.userUpdate(userUpdateDto);
		int user_no = userUpdateDto.getUser_no();
		wookiClientDao.deleteInterest(user_no);
		String interest_list = userUpdateDto.getInterest_list();
		if(!interest_list.isEmpty() && interest_list != null) {
			String[] interestArray = interest_list.split(",");
			for(int i = 0; i < interestArray.length; i++) {
				int exercise_no = Integer.parseInt(interestArray[i]);
				wookiClientDao.insertNewInterest(user_no, exercise_no);
			}
		}
		
		UsersDto usersDto = sqlSession.getMapper(UsersDao.class).getUserSession(user_no);
		HttpSession session = request.getSession();
		session.setAttribute("loginUser", usersDto);
	}

}
