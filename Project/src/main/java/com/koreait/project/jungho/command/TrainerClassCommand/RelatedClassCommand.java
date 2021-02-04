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
		
		TrainerClassDao trainerClassDao = sqlSession.getMapper(TrainerClassDao.class);
		List<TrainerClassDto> relatedClassList = trainerClassDao.relatedClass(trainerClassDto);
		
		Map<String, Object> result = new HashMap<String, Object>();
		result.put("relatedClassList", relatedClassList);
		
		if (relatedClassList.size() > 0) {
			result.put("result", true);
		} else {
			result.put("result", false);
		}
		// result 안에
		// 1. result,  2. relatedClassList  
		// 가 담겨져 있다.
		return result;
	}

}
