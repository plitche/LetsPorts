package com.koreait.project.hyejoon.command.myPage;

import java.util.HashMap;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;
import org.springframework.ui.Model;

import com.koreait.project.common.CommonMapCommand;
import com.koreait.project.hyejoon.dao.UsersDao;

public class UpdateMsgCommand implements CommonMapCommand {

	@Override
	public Map<String, Object> execute(SqlSession sqlSession, Model model) {
		
		Map<String, Object> map = model.asMap();
		int user_no = (Integer) map.get("user_no");
		String user_message = (String) map.get("user_message");
		
		System.out.println("유저넘버 : " + user_no + " 유저메시지: " + user_message);
		
		UsersDao usersDao = sqlSession.getMapper(UsersDao.class);
		
		Map<String, Object> result = new HashMap<String, Object>();
		
		result.put("result", usersDao.updateMsg(user_no, user_message));
		
		return result;
	}

}
