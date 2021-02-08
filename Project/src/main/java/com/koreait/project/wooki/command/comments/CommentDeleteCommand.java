package com.koreait.project.wooki.command.comments;

import java.util.HashMap;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;
import org.springframework.ui.Model;

import com.koreait.project.common.CommonMapCommand;
import com.koreait.project.wooki.dao.WookiDao;

public class CommentDeleteCommand implements CommonMapCommand {

	@Override
	public Map<String, Object> execute(SqlSession sqlSession, Model model) {
		int comment_no = (int) model.asMap().get("comment_no");
		
		WookiDao wookiDao = sqlSession.getMapper(WookiDao.class);
		int result = wookiDao.deleteComment(comment_no);
		
		Map<String, Object> map = new HashMap<String, Object>();
		if(result > 0) {
			map.put("result", true);
		} else {
			map.put("result", false);
		}
		return map;
	}

}
