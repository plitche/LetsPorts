package com.koreait.project.jungho.command.TrainerClassCommand;

import java.util.Map;

import org.apache.ibatis.session.SqlSession;
import org.springframework.ui.Model;

import com.koreait.project.common.CommonVoidCommand;
import com.koreait.project.jungho.dao.TrainerClassDao;

public class TrainerClassDeleteCommand implements CommonVoidCommand {

	@Override
	public void execute(SqlSession sqlSession, Model model) {

		Map<String, Object> map = model.asMap();
		int meeting_no = (int)map.get("meeting_no");
		
		TrainerClassDao trainerClassDao = sqlSession.getMapper(TrainerClassDao.class);
		
		trainerClassDao.materialsDelete(meeting_no);
		trainerClassDao.trainerClassDelete(meeting_no);
		
		
	}

}
