package com.koreait.project.jungho.command.WishTrainerCommand;

import java.util.HashMap;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;
import org.springframework.ui.Model;

import com.koreait.project.common.CommonMapCommand;
import com.koreait.project.jungho.dao.WishTrainerDao;

public class WishTrainerDeleteCommand implements CommonMapCommand {

	@Override
	public Map<String, Object> execute(SqlSession sqlSession, Model model) {

		Map<String, Object> map = model.asMap();
		int user_no = (int)map.get("user_no");

		WishTrainerDao wishTrainerDao = sqlSession.getMapper(WishTrainerDao.class);
		int results = wishTrainerDao.WishTrainerDelete(user_no);
		
		Map<String , Object> result = new HashMap<String, Object>();
		
		result.put("result", results);
		
		
		return result;
	}

}
