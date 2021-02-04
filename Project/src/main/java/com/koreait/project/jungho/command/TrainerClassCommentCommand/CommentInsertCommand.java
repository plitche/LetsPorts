package com.koreait.project.jungho.command.TrainerClassCommentCommand;

import java.util.HashMap;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;
import org.springframework.ui.Model;

import com.koreait.project.common.CommonMapCommand;
import com.koreait.project.dto.CommentsDto;
import com.koreait.project.jungho.dao.TrainerClassCommentDao;

public class CommentInsertCommand implements CommonMapCommand {

	@Override
	public Map<String, Object> execute(SqlSession sqlSession, Model model) {
		
		Map<String, Object> map = model.asMap();
		CommentsDto commentsDto = (CommentsDto)map.get("commentsDto");
		
		TrainerClassCommentDao trainerClassCommentDao = sqlSession.getMapper(TrainerClassCommentDao.class);
		
		int InsertResult = trainerClassCommentDao.commentInsert(commentsDto);
		
		Map<String, Object> result = new HashMap<String, Object>();

		if (InsertResult > 0) {
			result.put("result", true);
		} else {
			result.put("result", false);
		}
		
		return result;
	}

}
