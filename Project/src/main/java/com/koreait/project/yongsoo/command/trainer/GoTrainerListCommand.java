package com.koreait.project.yongsoo.command.trainer;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.ui.Model;

import com.koreait.project.common.CommonVoidCommand;
import com.koreait.project.yongsoo.dao.TrainerDao;
import com.koreait.project.yongsoo.dto.TrainerTemDto;

public class GoTrainerListCommand implements CommonVoidCommand {

	@Override
	public void execute(SqlSession sqlSession, Model model) {

		TrainerDao trainerDao = sqlSession.getMapper(TrainerDao.class);
		List<TrainerTemDto> trainerList = trainerDao.trainerList();
		
		
		for (int i=0; i<trainerList.size(); i++) {
			int user_no = trainerList.get(i).getUser_no();
			
			if (trainerDao.trainerScore(user_no)==null) {
				trainerList.get(i).setScore(0.0);
			} else {
				double score = trainerDao.trainerScore(user_no);
				score = Math.round(score*100);
				trainerList.get(i).setScore(score/100);
			}
			
			trainerList.get(i).setReviews(trainerDao.reviewCount(user_no));
		}

		model.addAttribute("trainerList", trainerList);
		
	}

}
