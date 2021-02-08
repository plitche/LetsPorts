package com.koreait.project.yongsoo.command.trainerReview;

import java.util.HashMap;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;
import org.springframework.ui.Model;

import com.koreait.project.common.CommonMapCommand;
import com.koreait.project.yongsoo.dao.TrainerReviewDao;

public class GetAllReviewContentCommand implements CommonMapCommand {

	@Override
	public Map<String, Object> execute(SqlSession sqlSession, Model model) {

		Map<String, Object> map = model.asMap();
		int review_no = (int)map.get("review_no");

		TrainerReviewDao trainerReviewDao = sqlSession.getMapper(TrainerReviewDao.class);
		String allReviewContent = trainerReviewDao.getAllReviewContent(review_no);
		
		Map<String, Object> result = new HashMap<String, Object>();
		
		if (!allReviewContent.isEmpty() && allReviewContent!=null) {
			result.put("result", true);
			result.put("allReviewContent", allReviewContent);
		} else {
			result.put("result", false);
		}
		
		return result;
	}

}
