package com.koreait.project.yongsoo.command.meetingComment;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;
import org.springframework.ui.Model;

import com.koreait.project.common.CommonMapCommand;
import com.koreait.project.yongsoo.dao.MeetingCommentDao;
import com.koreait.project.yongsoo.dto.CommentTemDto;

public class GetCommentListCommand implements CommonMapCommand {

	@Override
	public Map<String, Object> execute(SqlSession sqlSession, Model model) {

		Map<String, Object> map = model.asMap();
		int meeting_no = (int)map.get("meeting_no");
		
		MeetingCommentDao commentDao = sqlSession.getMapper(MeetingCommentDao.class);
		List<CommentTemDto> commentList = commentDao.getCommentList(meeting_no);

		Map<String, Object> result = new HashMap<String, Object>(); 
		
		if (commentList.size()>0) {
			result.put("result", true);
			result.put("commentList", commentList);
		} else {
			result.put("result", false);
		}
		return result;
	}

}
