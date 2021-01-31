package com.koreait.project.yongsoo.command.commonTrainer;

import java.util.Map;

import org.apache.ibatis.session.SqlSession;
import org.springframework.ui.Model;

import com.koreait.project.common.CommonVoidCommand;
import com.koreait.project.yongsoo.dao.TrainerDao;

public class GoTrainerDetailCommand implements CommonVoidCommand {

	@Override
	public void execute(SqlSession sqlSession, Model model) {

		Map<String, Object> map = model.asMap();
		int user_no = (int)map.get("user_no");
		
		TrainerDao trainerDao = sqlSession.getMapper(TrainerDao.class);
		model.addAttribute("trainerTemDto", trainerDao.trainerDetail(user_no));
		// model.addAttribute("reviewDto", trainerDao.findReview(user_no));
		// model.addAttribute("trainer_qnaDto", trainerDao.findQuestion(user_no));
		// model.addAttribute("trainer_user_no", user_no);
		
	}

}