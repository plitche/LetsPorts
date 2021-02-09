package com.koreait.project.wooki.command.admin;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;
import org.springframework.ui.Model;

import com.koreait.project.common.CommonMapCommand;
import com.koreait.project.wooki.dao.WookiDao;
import com.koreait.project.wooki.dto.UsersDto;

public class AdminListCommand implements CommonMapCommand {

	@Override
	public Map<String, Object> execute(SqlSession sqlSession, Model model) {
		WookiDao wookiDao = sqlSession.getMapper(WookiDao.class);
		List<UsersDto> list = wookiDao.adminList();
		
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("list", list);
		return map;
	}

}
