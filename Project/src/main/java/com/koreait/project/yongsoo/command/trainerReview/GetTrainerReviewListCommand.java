package com.koreait.project.yongsoo.command.trainerReview;

import java.text.SimpleDateFormat;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;
import org.springframework.ui.Model;

import com.koreait.project.common.CommonMapCommand;
import com.koreait.project.yongsoo.dao.TrainerReviewDao;
import com.koreait.project.yongsoo.dto.ReviewTemDto;

public class GetTrainerReviewListCommand implements CommonMapCommand {

	@Override
	public Map<String, Object> execute(SqlSession sqlSession, Model model) {

		Map<String, Object> map = model.asMap();
		int user_no = (int)map.get("user_no");
		
		TrainerReviewDao trainerReviewDao = sqlSession.getMapper(TrainerReviewDao.class);
		List<ReviewTemDto> reviewList = trainerReviewDao.getTrainerReviewList(user_no);
		
		SimpleDateFormat format = new SimpleDateFormat("yyyy:MM:dd HH:mm:ss");
		for(int i=0; i<reviewList.size(); i++) {
			reviewList.get(i).setCreated_at2(format.format(reviewList.get(i).getCreated_at()));
		}
		
		int reviewCount = trainerReviewDao.listCount(user_no);
		
		for(int i=0; i<reviewList.size(); i++) {
			if (reviewList.get(i).getContent().length()>150) {
				reviewList.get(i).setContent(reviewList.get(i).getContent().substring(0, 150) + "...");
			}
		}
		
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
