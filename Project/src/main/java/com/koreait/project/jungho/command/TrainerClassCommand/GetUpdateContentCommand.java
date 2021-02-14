package com.koreait.project.jungho.command.TrainerClassCommand;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;
import org.springframework.ui.Model;

import com.koreait.project.common.CommonVoidCommand;
import com.koreait.project.dto.MaterialsDto;
import com.koreait.project.jungho.dao.TrainerClassDao;

public class GetUpdateContentCommand implements CommonVoidCommand {

	@Override
	public void execute(SqlSession sqlSession, Model model) {

		Map<String , Object>map = model.asMap();
		int meeting_no = (int)map.get("meeting_no");
		
		System.out.println(meeting_no);
		
		TrainerClassDao trainerClassDao = sqlSession.getMapper(TrainerClassDao.class);
		
		// 준비물에 관련된 값들을 받아오고 list에 저장
		model.addAttribute("getMaterials", trainerClassDao.materialsView(meeting_no));
		model.addAttribute("getTrainerClassUpdate", trainerClassDao.trainerClassView(meeting_no));
		
	}

}
