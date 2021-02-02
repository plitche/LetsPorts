package com.koreait.project.yongsoo.command.trainerQnA;

import java.util.HashMap;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;
import org.springframework.ui.Model;

import com.koreait.project.common.CommonMapCommand;
import com.koreait.project.yongsoo.dao.TrainerQnADao;

public class WriteAnswerCommand implements CommonMapCommand {

	@Override
	public Map<String, Object> execute(SqlSession sqlSession, Model model) {

		Map<String, Object> map = model.asMap();
		int trainer_qna_no = (int)map.get("trainer_qna_no");
		int trainer_qna_answered = (int)map.get("trainer_qna_answered");
		
		TrainerQnADao trainerQnADao = sqlSession.getMapper(TrainerQnADao.class);
		int result = trainerQnADao.writeAnswer(trainer_qna_no, trainer_qna_answered);
		Map<String, Object> answerResult = new HashMap<String, Object>(); 
		
		if (result>0) {
			answerResult.put("result", true);
		} else {
			answerResult.put("result", false);
		}
		
		return answerResult;
	}

}
