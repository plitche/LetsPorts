package com.koreait.project.yongsoo.command.trainerQnA;

import java.util.HashMap;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;
import org.springframework.ui.Model;

import com.koreait.project.common.CommonMapCommand;
import com.koreait.project.dto.Trainer_qnaDto;
import com.koreait.project.yongsoo.dao.TrainerQnADao;

public class ShowQnACommand implements CommonMapCommand {

	@Override
	public Map<String, Object> execute(SqlSession sqlSession, Model model) {

		Map<String, Object> map = model.asMap();
		int trainer_qna_no = (int)map.get("trainer_qna_no");
		
		TrainerQnADao trainerQnADao = sqlSession.getMapper(TrainerQnADao.class);
		Trainer_qnaDto trainer_qnaDto = trainerQnADao.showQnA(trainer_qna_no);
		Map<String, Object> result = new HashMap<String, Object>();
		
		if (trainer_qnaDto!=null) {
			result.put("result", true);
			result.put("qna", trainer_qnaDto);
		}
		
		return result;
	}

}
