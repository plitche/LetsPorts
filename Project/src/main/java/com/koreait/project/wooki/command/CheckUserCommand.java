package com.koreait.project.wooki.command;

import java.util.HashMap;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;
import org.springframework.ui.Model;

import com.koreait.project.common.CommonMapCommand;
import com.koreait.project.wooki.dao.WookiDao;
import com.koreait.project.wooki.dto.UsersDto;

public class CheckUserCommand implements CommonMapCommand {

	@Override
	public Map<String, Object> execute(SqlSession sqlSession, Model model) {
		int user_no = (int) model.asMap().get("user_no");
		
		WookiDao wookiDao = sqlSession.getMapper(WookiDao.class);
		UsersDto usersDto = wookiDao.checkUser(user_no);
		
		Map<String, Object> map = new HashMap<String, Object>();
		if(usersDto != null) {
			map.put("result", true);
			map.put("user_nickname", usersDto.getUser_nickname());
		} else {
			map.put("result", false);
		}
		return map;
	}

}
