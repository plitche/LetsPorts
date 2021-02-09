package com.koreait.project.wooki.command.users;

import java.util.HashMap;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;
import org.springframework.ui.Model;

import com.koreait.project.common.CommonMapCommand;
import com.koreait.project.wooki.dao.WookiDao;
import com.koreait.project.wooki.dto.UsersDto;

public class ChangeEmailCommand implements CommonMapCommand {

	@Override
	public Map<String, Object> execute(SqlSession sqlSession, Model model) {
		Map<String, Object> map = model.asMap();
		UsersDto usersDto = (UsersDto) map.get("usersDto");
		
		WookiDao wookiDao = sqlSession.getMapper(WookiDao.class);
		int result = wookiDao.changeEmail(usersDto);
		Map<String, Object> resultMap = new HashMap<String, Object>();
		if(result > 0) {
			resultMap.put("result", true);
		} else {
			resultMap.put("result", false);
		}
		
		return resultMap;
	}

}
