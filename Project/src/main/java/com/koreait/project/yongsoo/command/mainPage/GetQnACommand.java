package com.koreait.project.yongsoo.command.mainPage;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;
import org.springframework.ui.Model;

import com.koreait.project.common.CommonMapCommand;
import com.koreait.project.yongsoo.dao.MainPageDao;
import com.koreait.project.yongsoo.dto.BoardQnATemDto;

public class GetQnACommand implements CommonMapCommand {

	@Override
	public Map<String, Object> execute(SqlSession sqlSession, Model model) {

		MainPageDao mainPageDao = sqlSession.getMapper(MainPageDao.class);
		
		List<BoardQnATemDto> qnaList = mainPageDao.getQnA();
		
		Map<String, Object> result = new HashMap<String, Object>();
		if(qnaList.size()>0) {
			result.put("result", true);
			result.put("data", qnaList);
		} else {
			result.put("result", false);
		}
		
		return result;
	}

}
