package com.koreait.project.wooki.command.boards;

import java.util.HashMap;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;
import org.springframework.ui.Model;

import com.koreait.project.common.CommonMapCommand;
import com.koreait.project.wooki.dao.WookiDao;

public class BoardsOnHideToggleCommand implements CommonMapCommand {

	@Override
	public Map<String, Object> execute(SqlSession sqlSession, Model model) {
		int board_sep = (int) model.asMap().get("board_sep");
		int board_no = (int) model.asMap().get("board_no");
		int on_hide = (int) model.asMap().get("on_hide");
		
		WookiDao wookiDao = sqlSession.getMapper(WookiDao.class);
		int result = wookiDao.boardsOnHideToggle(board_sep, board_no, on_hide);
		
		Map<String, Object> map = new HashMap<String, Object>();
		if(result >0) {
			map.put("result", true);
		} else {
			map.put("result", false);
		}
		return map;
	}

}
