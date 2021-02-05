package com.koreait.project.jungho.command.TrainerClassCommand;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;
import org.springframework.ui.Model;

import com.koreait.project.common.CommonMapCommand;
import com.koreait.project.jungho.dao.TrainerClassDao;
import com.koreait.project.jungho.dto.TrainerClassDto;

public class RelatedClassCommand implements CommonMapCommand {

	@Override
	public Map<String, Object> execute(SqlSession sqlSession, Model model) {

		Map<String, Object> map = model.asMap();
		TrainerClassDto trainerClassDto = (TrainerClassDto)map.get("trainerClassDto");
		
		int exercise_no = trainerClassDto.getExercise_no();
		int user_no = trainerClassDto.getUser_no();
		int meeting_no = trainerClassDto.getMeeting_no();
		
		
		TrainerClassDao trainerClassDao = sqlSession.getMapper(TrainerClassDao.class);
		List<TrainerClassDto> relatedClassList = trainerClassDao.relatedClass(user_no, exercise_no);
		
		Map<String, Object> result = new HashMap<String, Object>();
		
		if (relatedClassList.size() > 0) {
			result.put("result", true);
			result.put("relatedClassList", relatedClassList);
		} else {
			result.put("result", false);
		}
		// result 안에
		// 1. result,  2. relatedClassList  
		// 가 담겨져 있다.
		return result;
	}

}
