package com.koreait.project.jungho.command.TrainerClassCommand;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;
import org.springframework.ui.Model;

import com.koreait.project.common.CommonVoidCommand;
import com.koreait.project.dto.MaterialsDto;
import com.koreait.project.jungho.dao.TrainerClassDao;
import com.koreait.project.jungho.dto.TrainerClassDto;

public class TrainerClassViewCommand implements CommonVoidCommand {

	@Override
	public void execute(SqlSession sqlSession, Model model) {

		Map<String, Object> map = model.asMap();
		int meeting_no = (int)map.get("meeting_no");
		
		TrainerClassDao trainerClassDao = sqlSession.getMapper(TrainerClassDao.class);
		
		// 모임에 관련된 값들을 받아오고 trainerClassDto에 저장
		TrainerClassDto trainerClassDto = trainerClassDao.trainerClassView(meeting_no);
		
		// 준비물에 관련된 값들을 받아오고 list에 저장
		List<MaterialsDto> list = trainerClassDao.materialsView(meeting_no);
		
		// 조회수 늘려주는 명령
		trainerClassDao.addhit(meeting_no);
		
		// 모임에 관련된 값들을 보내주는 값
		model.addAttribute("trainerClassDto", trainerClassDto);
		// 준비물에 대한 값들을 보내주는 값
		model.addAttribute("list", list);
		
		
		
	}

}
