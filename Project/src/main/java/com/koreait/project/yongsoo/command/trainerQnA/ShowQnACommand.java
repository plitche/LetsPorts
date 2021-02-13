package com.koreait.project.yongsoo.command.trainerQnA;

import java.text.SimpleDateFormat;
import java.util.HashMap;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;
import org.springframework.ui.Model;

import com.koreait.project.common.CommonMapCommand;
import com.koreait.project.yongsoo.dao.TrainerQnADao;
import com.koreait.project.yongsoo.dto.QnATemDto;

public class ShowQnACommand implements CommonMapCommand {

	@Override
	public Map<String, Object> execute(SqlSession sqlSession, Model model) {

		Map<String, Object> map = model.asMap();
		int trainer_qna_no = (int)map.get("trainer_qna_no");
		
		TrainerQnADao trainerQnADao = sqlSession.getMapper(TrainerQnADao.class);
		QnATemDto qnaTemDto = trainerQnADao.showQnA(trainer_qna_no);
		Map<String, Object> result = new HashMap<String, Object>();
		
		SimpleDateFormat format = new SimpleDateFormat("yyyy:MM:dd(E) HH:mm");
		
		if (qnaTemDto!=null) {
			qnaTemDto.setCreated_at2(format.format(qnaTemDto.getCreated_at()));
			if(qnaTemDto.getIs_answered()==1) {	// 답변 아직 0
				result.put("answer", true);
				qnaTemDto.setAnswered_date2(format.format(qnaTemDto.getAnswered_date()));
			} else {
				result.put("answer", false);
			}
			result.put("result", true);
			result.put("qna", qnaTemDto);
		} else {
			result.put("result", false);
		}
		
		return result;
	}

}
