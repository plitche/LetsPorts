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
		int nickResult = usersDao.nickCheck(user_nickname);
		
		
		Map<String, Object> result = new HashMap<String, Object>();
		
		if(nickResult > 0) {
			result.put("result", 1);
		} else {
			result.put("result", 0);
		}
		
		return result;
	}

}
