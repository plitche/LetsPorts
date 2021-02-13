package com.koreait.project.jungho.command.WishClassListCommand;

import java.sql.Date;
import java.util.HashMap;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;
import org.springframework.ui.Model;

import com.koreait.project.common.CommonMapCommand;
import com.koreait.project.jungho.dao.WishClassListDao;

public class WishClassListInsertCommand implements CommonMapCommand {

	@Override
	public Map<String, Object> execute(SqlSession sqlSession, Model model) {

		Map<String, Object> map = model.asMap();
		WishClassListDao wishClassListDao = sqlSession.getMapper(WishClassListDao.class);
		
		
		int scrap_referer_no = (int)map.get("scrap_referer_no");
		int user_no = (int)map.get("user_no");
		Date end_gather_date = (Date)map.get("end_gather_date");
		
	
		Map<String, Object> result = new HashMap<String, Object>();
		result.put("WishClassListTotal", wishClassListDao.WishClassListTotal(scrap_referer_no));
		
		int results = wishClassListDao.WishClassInsert(user_no, scrap_referer_no, end_gather_date);
		result.put("result", results);
		
		return result;
		
	}

}
