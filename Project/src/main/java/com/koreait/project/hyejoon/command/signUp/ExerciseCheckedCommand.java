package com.koreait.project.hyejoon.command.signUp;

import java.util.Map;

import org.apache.ibatis.session.SqlSession;
import org.springframework.ui.Model;

import com.koreait.project.common.CommonMapCommand;
import com.koreait.project.hyejoon.dao.UsersDao;

public class ExerciseCheckedCommand implements CommonMapCommand {

	@Override
	public Map<String, Object> execute(SqlSession sqlSession, Model model) {
		Map<String, Object> map = model.asMap();
		int exercise_no = (int)map.get("exercise_no");
		UsersDao usersDao = sqlSession.getMapper(UsersDao.class);
		
		
	}

}
