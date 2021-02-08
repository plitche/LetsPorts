package com.koreait.project.yongsoo.command.qna;

import java.util.HashMap;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;
import org.springframework.ui.Model;

import com.koreait.project.common.CommonMapCommand;
import com.koreait.project.dto.CommentsDto;
import com.koreait.project.yongsoo.dao.CommonQnADao;

public class UpdateQnACommentContentCommand implements CommonMapCommand {

	@Override
	public Map<String, Object> execute(SqlSession sqlSession, Model model) {

		Map<String, Object> map = model.asMap();
		CommentsDto commentsDto = (CommentsDto)map.get("commentsDto");
		int comment_no = commentsDto.getComment_no();
		String comment_content = commentsDto.getComment_content();
		
		CommonQnADao commonQnADao = sqlSession.getMapper(CommonQnADao.class);
		int updateResult = commonQnADao.updateQnAComment(comment_no, comment_content);
		
		Map<String, Object> result = new HashMap<String, Object>();
		
		if (updateResult>0) {
			result.put("result", true);
		} else {
			result.put("reuslt", false);
		}
		
		return result;
	}

}
