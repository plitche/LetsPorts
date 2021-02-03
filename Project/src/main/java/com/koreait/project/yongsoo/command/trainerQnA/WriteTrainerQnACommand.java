package com.koreait.project.yongsoo.command.trainerQnA;

import java.util.HashMap;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;
import org.springframework.ui.Model;

import com.koreait.project.common.CommonMapCommand;
import com.koreait.project.dto.Trainer_qnaDto;
import com.koreait.project.yongsoo.dao.TrainerQnADao;

public class WriteTrainerQnACommand implements CommonMapCommand {

	@Override
	public Map<String, Object> execute(SqlSession sqlSession, Model model) {

		Map<String, Object> map = model.asMap();
		Trainer_qnaDto trainer_qnaDto = (Trainer_qnaDto)map.get("trainer_qnaDto");
		
		TrainerQnADao trainerQnADao = sqlSession.getMapper(TrainerQnADao.class);
		int insertQnAToTrainerResult = trainerQnADao.insertQnAToTrainer(trainer_qnaDto);
		int is_published = trainer_qnaDto.getIs_published();
		
		Map<String, Object> insertQnAResult = new HashMap<String, Object>();
		
		if(insertQnAToTrainerResult>0) {
			insertQnAResult.put("result", true);
		} else {
			insertQnAResult.put("result", false);
		}
		
		return insertQnAResult;
	}

}
