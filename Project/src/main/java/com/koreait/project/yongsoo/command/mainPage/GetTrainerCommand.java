package com.koreait.project.yongsoo.command.mainPage;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;
import org.springframework.ui.Model;

import com.koreait.project.common.CommonMapCommand;
import com.koreait.project.yongsoo.dao.MainPageDao;
import com.koreait.project.yongsoo.dto.TrainerTemDto;

public class GetTrainerCommand implements CommonMapCommand {

	@Override
	public Map<String, Object> execute(SqlSession sqlSession, Model model) {
		
		MainPageDao mainPageDao = sqlSession.getMapper(MainPageDao.class);
		
		List<TrainerTemDto> trainerList = mainPageDao.getTrainer();

		if (trainerList.size()>0) {
			for(int i=0; i<trainerList.size(); i++) {
				double score = trainerList.get(i).getScore();
				score = Math.round(score*100);
				trainerList.get(i).setScore(score/100);
				trainerList.get(i).setReviews(mainPageDao.reviewCount(trainerList.get(i).getUser_no()));
			}
			
		}
		
		Map<String, Object> result = new HashMap<String, Object>();
		
		if(trainerList.size()>0) {
			result.put("result", true);
			result.put("trainerList", trainerList);
		} else {
			result.put("result", false);
		}
		
		return result;
	}

}
