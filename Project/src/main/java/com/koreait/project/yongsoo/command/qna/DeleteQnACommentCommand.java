package com.koreait.project.yongsoo.command.qna;

import java.util.HashMap;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;
import org.springframework.ui.Model;

import com.koreait.project.common.CommonMapCommand;
import com.koreait.project.yongsoo.dao.CommonQnADao;

public class DeleteQnACommentCommand implements CommonMapCommand {

	@Override
	public Map<String, Object> execute(SqlSession sqlSession, Model model) {

		Map<String, Object> map = model.asMap();
		int qnaComment_no = (int)map.get("qnaComment_no");
		CommonQnADao commonQnADao = sqlSession.getMapper(CommonQnADao.class);
		int deleteResult = commonQnADao.deleteQnAComment(qnaComment_no);
		
		Map<String, Object> result = new HashMap<String, Object>();

		if (deleteResult>0) {
			result.put("result", true);
		} else {
			result.put("result", false);
		}
		
		return result;
	}

}
