package com.koreait.project.hyejoon.command.userAccount;

import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.apache.ibatis.session.SqlSession;
import org.springframework.ui.Model;

import com.koreait.project.common.CommonVoidCommand;
import com.koreait.project.dto.User_interestDto;
import com.koreait.project.dto.UsersDto;
import com.koreait.project.hyejoon.dao.UsersDao;
import com.koreait.project.hyejoon.dao.WookiClientDao;
import com.koreait.project.hyejoon.dto.UserUpdateDto;

public class UserUpdateViewCommand implements CommonVoidCommand {

	@Override
	public void execute(SqlSession sqlSession, Model model) {
		// user_interest 테이블을 위한 것!
		Map<String, Object> map = model.asMap();
		
		
		HttpServletRequest request = (HttpServletRequest) map.get("request");
		HttpSession session = request.getSession();
		UsersDto loginUser = (UsersDto)session.getAttribute("loginUser");
		int user_no = loginUser.getUser_no();
		
		UsersDao usersDao = sqlSession.getMapper(UsersDao.class);
		//model.addAttribute("userInterestList", usersDao.userUpdateView(loginUser.getUser_no()));
		
		UserUpdateDto userUpdateDto = sqlSession.getMapper(WookiClientDao.class).updateUserInfo(user_no);
		userUpdateDto.setInterest_list(sqlSession.getMapper(WookiClientDao.class).updateUserInterest(user_no));
		
		List<User_interestDto> list = usersDao.userUpdateInterest(user_no);
		int[] exercise_noList = new int[list.size()];
		String[] exercise_nameList = new String[list.size()];
		
		for (int i=0; i<list.size(); i++) {
			exercise_noList[i] = list.get(i).getExercise_no();
			exercise_nameList[i] = usersDao.getExerciseName(exercise_noList[i]);
		}
		
		model.addAttribute("interests", list);
		model.addAttribute("exercise_nameList", exercise_nameList);
		model.addAttribute("updateUser", userUpdateDto);
	}

}
