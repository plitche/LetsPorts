package com.koreait.project.yongsoo.command.comment;

import java.util.HashMap;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;
import org.springframework.ui.Model;

import com.koreait.project.common.CommonMapCommand;
import com.koreait.project.yongsoo.dao.CommentDao;

public class DeleteCommentCommand implements CommonMapCommand {

	@Override
	public Map<String, Object> execute(SqlSession sqlSession, Model model) {

		Map<String, Object> map = model.asMap();
		int comment_no = (int)map.get("comment_no");
		CommentDao commentDao = sqlSession.getMapper(CommentDao.class);
		int deleteResult = commentDao.deleteComment(comment_no);
		
		Map<String, Object> result = new HashMap<String, Object>();

		if (deleteResult > 0) {
			result.put("result", true);
		} else {
			result.put("result", false);
		}
		
		return result;
	}

}
