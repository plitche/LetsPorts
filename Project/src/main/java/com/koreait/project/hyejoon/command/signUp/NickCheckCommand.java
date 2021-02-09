package com.koreait.project.hyejoon.command.signUp;

import java.util.HashMap;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;
import org.springframework.ui.Model;

import com.koreait.project.common.CommonMapCommand;
import com.koreait.project.hyejoon.dao.UsersDao;

public class NickCheckCommand implements CommonMapCommand {

	@Override
	public Map<String, Object> execute(SqlSession sqlSession, Model model) {
		
		Map<String, Object> map = model.asMap();
		String user_nickname = (String)map.get("user_nickname");
		UsersDao usersDao = sqlSession.getMapper(UsersDao.class);
		
		Map<String, Object> result = new HashMap<String, Object>();
		result.put("result", usersDao.nickCheck(user_nickname));
		
		return result;
		
	}

}
