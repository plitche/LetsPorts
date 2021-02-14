package com.koreait.project.wooki.command;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;
import org.springframework.ui.Model;

import com.koreait.project.common.CommonMapCommand;
import com.koreait.project.wooki.dao.WookiDao;
import com.koreait.project.wooki.dto.CreateUserCountDto;

public class SelectChartDataCommand implements CommonMapCommand {

	@Override
	public Map<String, Object> execute(SqlSession sqlSession, Model model) {
		// 이번달 일별회원수
		List<CreateUserCountDto> list = sqlSession.getMapper(WookiDao.class).dailyCreateUserCount();
		// 이번달 이전 누적회원수
		int beforeTotalUser = sqlSession.getMapper(WookiDao.class).beforeTotalUser();
		
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("list", list);
		map.put("beforeTotalUser", beforeTotalUser);
		
		return map;
	}

}
