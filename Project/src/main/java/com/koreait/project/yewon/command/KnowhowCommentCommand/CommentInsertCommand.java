package com.koreait.project.yewon.command.KnowhowCommentCommand;

import java.util.HashMap;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;
import org.springframework.ui.Model;

import com.koreait.project.common.CommonMapCommand;
import com.koreait.project.dto.CommentsDto;
import com.koreait.project.jungho.dao.TrainerClassCommentDao;
import com.koreait.project.yewon.controller.knowhowCommentController;
import com.koreait.project.yewon.dao.KnowhowCommentDao;
import com.koreait.project.yewon.dto.knowhowClassDto;

public class CommentInsertCommand implements CommonMapCommand {

	@Override
	public Map<String, Object> execute(SqlSession sqlSession, Model model) {
		
		Map<String, Object> map = model.asMap();
		knowhowClassDto knowhowClassDto = (knowhowClassDto)map.get("knowhowClassDto");
		
		KnowhowCommentDao knowhowCommentDao  = sqlSession.getMapper(KnowhowCommentDao.class);
		
		int InsertResult = knowhowCommentDao.commentInsert(knowhowClassDto);
		
		Map<String, Object> result = new HashMap<String, Object>();

		if (InsertResult > 0) {
			result.put("result", true);
		} else {
			result.put("result", false);
		}
		
		return result;
	}

}
