package com.koreait.project.jungho.command.WishClassListCommand;

import java.util.HashMap;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;
import org.springframework.ui.Model;

import com.koreait.project.common.CommonMapCommand;
import com.koreait.project.jungho.dao.WishClassListDao;

public class WishClassTotalCommand implements CommonMapCommand {

	@Override
	public Map<String, Object> execute(SqlSession sqlSession, Model model) {

		Map<String, Object> map = model.asMap();
		int meeting_no = (int)map.get("meeting_no");
		
		WishClassListDao wishClassListDao = sqlSession.getMapper(WishClassListDao.class);
		
		Map<String, Object> result = new HashMap<String, Object>();
		
		result.put("WishClassListTotal", wishClassListDao.WishClassListTotal(meeting_no));
		
		
		
		return result;
	}

}
