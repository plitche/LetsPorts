package com.koreait.project.wooki.command.admin;

import java.util.HashMap;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;
import org.springframework.ui.Model;

import com.koreait.project.common.CommonMapCommand;
import com.koreait.project.wooki.dao.WookiDao;

public class UpdateNormalUserCommand implements CommonMapCommand {

	@Override
	public Map<String, Object> execute(SqlSession sqlSession, Model model) {
		int user_no = (int) model.asMap().get("user_no");
		
		WookiDao wookiDao = sqlSession.getMapper(WookiDao.class);
		int result = wookiDao.updateNormalUser(user_no);
		
		Map<String, Object> map = new HashMap<String, Object>();
		if(result > 0) {
			map.put("result", true);
		} else {
			map.put("result", false);
		}
		return map;
	}

}
