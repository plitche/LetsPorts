package com.koreait.project.wooki.command.users;

import java.util.HashMap;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;
import org.springframework.ui.Model;

import com.koreait.project.common.CommonMapCommand;
import com.koreait.project.wooki.dao.WookiDao;

public class ChangeEmailIsPossibleCommand implements CommonMapCommand {

	@Override
	public Map<String, Object> execute(SqlSession sqlSession, Model model) {
		Map<String, Object> map = model.asMap();
		String email = (String) map.get("email");
		
		WookiDao wookiDao = sqlSession.getMapper(WookiDao.class);
		int result = wookiDao.changeEmailIsPossible(email);
		
		Map<String, Object> resultMap = new HashMap<String, Object>();
		if(result > 0) {
			resultMap.put("result", false);
		} else {
			resultMap.put("result", true);
		}
		
		return resultMap;
	}

}
