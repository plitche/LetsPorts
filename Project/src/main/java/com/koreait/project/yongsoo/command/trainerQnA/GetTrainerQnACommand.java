package com.koreait.project.yongsoo.command.trainerQnA;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;
import org.springframework.ui.Model;

import com.koreait.project.common.CommonMapCommand;
import com.koreait.project.dto.Trainer_qnaDto;
import com.koreait.project.yongsoo.dao.TrainerDao;
import com.koreait.project.yongsoo.dao.TrainerQnADao;
import com.koreait.project.yongsoo.dto.TrainerTemDto;

public class GetTrainerQnACommand implements CommonMapCommand {

	@Override
	public Map<String, Object> execute(SqlSession sqlSession, Model model) {

		Map<String, Object> map = model.asMap();
		int user_no = (int)map.get("user_no");
		
		TrainerQnADao trainerQnADao = sqlSession.getMapper(TrainerQnADao.class);
		List<Trainer_qnaDto> qnalist = trainerQnADao.getTrainerQnAList(user_no); 
		int totalQnACount = trainerQnADao.TrainerQnACount(user_no);
		
		TrainerDao trainerDao = sqlSession.getMapper(TrainerDao.class);
		TrainerTemDto trainerTemDto = trainerDao.trainerDetail(user_no);
		
		Map<String, Object> result = new HashMap<String, Object>(); 
		if (qnalist.size()>0) {
			result.put("result", true);
			result.put("qnaList", qnalist);
			result.put("totalQnACount", totalQnACount);
			result.put("trainerTemDto", trainerTemDto);
		} else {
			result.put("result", false);
			result.put("totalQnACount", 0);
		}
		
		return result;
	}

}
