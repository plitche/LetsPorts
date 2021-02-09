package com.koreait.project.yongsoo.command.qna;

import java.util.HashMap;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;
import org.springframework.ui.Model;

import com.koreait.project.common.CommonMapCommand;
import com.koreait.project.dto.CommentsDto;
import com.koreait.project.yongsoo.dao.CommonQnADao;

public class AddQnACommnetCommand implements CommonMapCommand {

	@Override
	public Map<String, Object> execute(SqlSession sqlSession, Model model) {

		Map<String, Object> map = model.asMap();
		CommentsDto commentsDto = (CommentsDto)map.get("commentsDto");
		
		CommonQnADao commonQnADao = sqlSession.getMapper(CommonQnADao.class);
		int addCommentResult = commonQnADao.addQnACommnet(commentsDto);
		
		Map<String, Object> result = new HashMap<String, Object>();
		if (addCommentResult>0) {
			result.put("result", true);
		} else {
			result.put("result", false);
		}
		
		return result;
	}

}
