package com.koreait.project.hyejoon.command;

import java.util.HashMap;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;
import org.springframework.ui.Model;

import com.koreait.project.common.CommonMapCommand;
import com.koreait.project.hyejoon.dao.UsersDao;

public class PwCheckCommand implements CommonMapCommand {

	@Override
	public Map<String, Object> execute(SqlSession sqlSession, Model model) {
		Map<String, Object> map = model.asMap();
		String password = (String)map.get("password");
		UsersDao usersDao = sqlSession.getMapper(UsersDao.class);
		int pwResult = usersDao.pwCheck(password);
		
		
		Map<String, Object> result = new HashMap<String, Object>();
		
		if(pwResult > 0) {
			result.put("result", 1);
		} else {
			result.put("result", 0);
		}
		
		return result;
	}

}
