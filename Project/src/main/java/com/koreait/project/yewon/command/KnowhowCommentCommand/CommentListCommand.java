package com.koreait.project.yewon.command.KnowhowCommentCommand;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;
import org.springframework.ui.Model;

import com.koreait.project.common.CommonMapCommand;
import com.koreait.project.dto.CommentsDto;
import com.koreait.project.jungho.dao.TrainerClassCommentDao;
import com.koreait.project.yewon.dao.KnowHowCommentDao;
import com.koreait.project.yewon.dto.KnowhowClassDto;

public class CommentListCommand implements CommonMapCommand {

	@Override
	public Map<String, Object> execute(SqlSession sqlSession, Model model) {

		Map<String, Object> map = model.asMap();
		int comment_no = (int)map.get("comment_no");
		
		KnowHowCommentDao knowhowCommentDao = sqlSession.getMapper(KnowHowCommentDao.class);
		
		Map<String, Object> resultMap = new HashMap<>();
		
		List<CommentsDto> commentList = knowhowCommentDao.commentList(comment_no);
		resultMap.put("commentList", commentList);
		resultMap.put("totalCount", commentList.size());
		
		if (commentList.size() > 0) {
			resultMap.put("result", true);
		} else {
			resultMap.put("result", false);
		}
		
		return resultMap;
	}

}
