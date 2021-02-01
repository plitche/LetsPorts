package com.koreait.project.yongsoo.command.comment;

import java.util.HashMap;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;
import org.springframework.ui.Model;

import com.koreait.project.common.CommonMapCommand;
import com.koreait.project.dto.CommentsDto;
import com.koreait.project.yongsoo.dao.CommentDao;

public class AddCommentCommand implements CommonMapCommand {

	@Override
	public Map<String, Object> execute(SqlSession sqlSession, Model model) {

		Map<String, Object> map = model.asMap();
		CommentsDto commentsDto = (CommentsDto)map.get("commentsDto");
		CommentDao commentDao = sqlSession.getMapper(CommentDao.class);
		int addCommentresult = commentDao.addComment(commentsDto);
		
		Map<String, Object> result = new HashMap<String, Object>();
		
		if (addCommentresult > 0) {
			result.put("result", true);
		} else {
			result.put("result", false);
		}
		
		return result;
	}

}
