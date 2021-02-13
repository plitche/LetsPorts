package com.koreait.project.jungho.command.WishTrainerCommand;

import java.util.HashMap;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;
import org.springframework.ui.Model;

import com.koreait.project.common.CommonMapCommand;
import com.koreait.project.jungho.dao.WishTrainerDao;

public class WishTrainerInsertCommand implements CommonMapCommand {

	@Override
	public Map<String, Object> execute(SqlSession sqlSession, Model model) {

		Map<String, Object> map = model.asMap();
		int scrap_referer_no = (int)map.get("scrap_referer_no");
		int user_no = (int)map.get("user_no");
		
		WishTrainerDao wishTrainerDao = sqlSession.getMapper(WishTrainerDao.class);
		
		Map<String, Object> result = new HashMap<String, Object>();
		
		int results = wishTrainerDao.WishTrainerInsert(user_no, scrap_referer_no);
		
		result.put("result", results);
		
		return result;
	}

}
