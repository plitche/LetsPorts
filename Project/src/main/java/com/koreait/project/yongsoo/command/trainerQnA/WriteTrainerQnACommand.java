package com.koreait.project.yongsoo.command.trainerQnA;

import java.util.HashMap;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;
import org.springframework.ui.Model;

import com.koreait.project.common.CommonMapCommand;
import com.koreait.project.dto.Trainer_qnaDto;
import com.koreait.project.yongsoo.dao.TrainerDao;

public class WriteTrainerQnACommand implements CommonMapCommand {

	@Override
	public Map<String, Object> execute(SqlSession sqlSession, Model model) {

		Map<String, Object> map = model.asMap();
		Trainer_qnaDto trainer_qnaDto = (Trainer_qnaDto)map.get("trainer_qnaDto");
		int user_no = trainer_qnaDto.getTrainer_user_no();
		
		TrainerDao trainerDao = sqlSession.getMapper(TrainerDao.class);
		int insertQnAToTrainerResult = trainerDao.insertQnAToTrainer(trainer_qnaDto);
		
		Map<String, Object> map2 = new HashMap<String, Object>();
		
		if(insertQnAToTrainerResult>0) {
			map2.put("result", true);
			map2.put("qnaList", trainerDao.findQuestion(user_no));
		} else {
			map2.put("result", false);
		}
		
		return map2;
	}

}
