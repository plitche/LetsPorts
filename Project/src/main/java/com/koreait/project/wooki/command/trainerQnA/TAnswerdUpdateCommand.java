package com.koreait.project.wooki.command.trainerQnA;

import java.util.HashMap;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;
import org.springframework.ui.Model;

import com.koreait.project.common.CommonMapCommand;
import com.koreait.project.wooki.dao.WookiDao;
import com.koreait.project.wooki.dto.Trainer_qnaDto;

public class TAnswerdUpdateCommand implements CommonMapCommand {

	@Override
	public Map<String, Object> execute(SqlSession sqlSession, Model model) {
		Trainer_qnaDto tQnA = (Trainer_qnaDto) model.asMap().get("tQnA");
		int trainer_qna_no = tQnA.getTrainer_qna_no();
		String trainer_qna_answered = tQnA.getTrainer_qna_answered();
		
		WookiDao wookiDao = sqlSession.getMapper(WookiDao.class);
		int result = wookiDao.tAnswerdUpdate(trainer_qna_no, trainer_qna_answered);
		
		Map<String, Object> map = new HashMap<String, Object>();
		if(result > 0) {
			map.put("result", true);
		} else {
			map.put("result", false);
		}
		return map;
	}

}
