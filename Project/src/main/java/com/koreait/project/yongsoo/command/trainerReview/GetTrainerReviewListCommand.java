package com.koreait.project.yongsoo.command.trainerReview;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;
import org.springframework.ui.Model;

import com.koreait.project.common.CommonMapCommand;
import com.koreait.project.dto.ReviewDto;
import com.koreait.project.yongsoo.dao.TrainerReviewDao;

public class GetTrainerReviewListCommand implements CommonMapCommand {

	@Override
	public Map<String, Object> execute(SqlSession sqlSession, Model model) {

		Map<String, Object> map = model.asMap();
		int user_no = (int)map.get("user_no");
		
		TrainerReviewDao trainerReviewDao = sqlSession.getMapper(TrainerReviewDao.class);
		List<ReviewDto> reviewList = trainerReviewDao.getTrainerReviewList(user_no);
		int reviewCount = trainerReviewDao.listCount(user_no);
		
		Map<String, Object> result = new HashMap<String, Object>();
		
		if (reviewList.size()>0) {
			result.put("result", true);
			result.put("reviewList", reviewList);
			result.put("reviewCount", reviewCount);
		} else {
			result.put("result", false);
			result.put("reviewCount", 0);
		}
		
		return result;
	}

}
