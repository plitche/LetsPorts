package com.koreait.project.yewon.command.KnowhowCommentCommand;

import java.util.HashMap;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;
import org.springframework.ui.Model;

import com.koreait.project.common.CommonMapCommand;
import com.koreait.project.jungho.dao.TrainerClassCommentDao;
import com.koreait.project.yewon.dao.KnowHowCommentDao;

public class CommentDeleteCommand implements CommonMapCommand {

	@Override
	public Map<String, Object> execute(SqlSession sqlSession, Model model) {

		Map<String, Object> map = model.asMap();
		int comment_no = (int)map.get("comment_no");
		
		KnowHowCommentDao knowhowCommentDao = sqlSession.getMapper(KnowHowCommentDao.class);
		
		int deleteResult = knowhowCommentDao.commentDelete(comment_no);
		
		Map<String, Object> result = new HashMap<String, Object>();
		
		if (deleteResult > 0) {
			result.put("result", true);
		} else {
			result.put("result", false);
		}
		return result;
	}

}
