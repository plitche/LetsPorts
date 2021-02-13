package com.koreait.project.jungho.command.WishTrainerCommand;

import java.util.HashMap;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;
import org.springframework.ui.Model;

import com.koreait.project.common.CommonMapCommand;
import com.koreait.project.jungho.dao.WishTrainerDao;

public class WishTrainerTotalCommand implements CommonMapCommand {

	@Override
	public Map<String, Object> execute(SqlSession sqlSession, Model model) {

		Map<String, Object> map = model.asMap();
		
		int scrap_referer_no = (int)map.get("scrap_referer_no");
		WishTrainerDao wishTrainerDao = sqlSession.getMapper(WishTrainerDao.class);
		
		Map<String, Object> result = new HashMap<String, Object>();
		
		result.put("WishTrainerListTotal", wishTrainerDao.WishTrainerListTotal(scrap_referer_no));
		
		return result;
	}

}
