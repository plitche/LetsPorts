package com.koreait.project.yewon.command.KnowhowCommentCommand;

import java.util.HashMap;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;
import org.springframework.ui.Model;

import com.koreait.project.common.CommonMapCommand;
import com.koreait.project.dto.CommentsDto;
import com.koreait.project.jungho.dao.TrainerClassCommentDao;
import com.koreait.project.yewon.controller.KnowHowCommentController;
import com.koreait.project.yewon.dao.KnowHowCommentDao;
import com.koreait.project.yewon.dto.KnowhowClassDto;

public class CommentInsertCommand implements CommonMapCommand {

	@Override
	public Map<String, Object> execute(SqlSession sqlSession, Model model) {
		
		Map<String, Object> map = model.asMap();
		KnowhowClassDto knowhowClassDto = (KnowhowClassDto)map.get("knowhowClassDto");
		
		KnowHowCommentDao knowhowCommentDao  = sqlSession.getMapper(KnowHowCommentDao.class);
		
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
