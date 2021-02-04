package com.koreait.project.yongsoo.command.comment;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;
import org.springframework.ui.Model;

import com.koreait.project.common.CommonMapCommand;
import com.koreait.project.dto.CommentsDto;
import com.koreait.project.yongsoo.dao.CommentDao;
import com.koreait.project.yongsoo.dao.TrainerDao;
import com.koreait.project.yongsoo.dto.TrainerTemDto;

public class GetCommentListCommand implements CommonMapCommand {

	@Override
	public Map<String, Object> execute(SqlSession sqlSession, Model model) {

		Map<String, Object> map = model.asMap();
		int meeting_no = (int)map.get("meeting_no");
		
		CommentDao commentDao = sqlSession.getMapper(CommentDao.class);
		List<CommentsDto> commentList = commentDao.getCommentList(meeting_no);
		
		TrainerDao trainerDao = sqlSession.getMapper(TrainerDao.class);
		List<TrainerTemDto> userList = new ArrayList<TrainerTemDto>();
		
		for (int i=0; i<commentList.size(); i++) {
			userList.set(i, trainerDao.trainerDetail(commentList.get(i).getUser_no()));
		}
				
		Map<String, Object> result = new HashMap<String, Object>(); 
		result.put("commentList", commentList);
		if (commentList.size()>0) {
			result.put("result", true);
			result.put("userList", userList);
		} else {
			result.put("result", false);
		}
		return result;
	}

}
