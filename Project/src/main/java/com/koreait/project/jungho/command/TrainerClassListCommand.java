package com.koreait.project.jungho.command;

import org.apache.ibatis.session.SqlSession;
import org.springframework.ui.Model;

import com.koreait.project.common.CommonVoidCommand;
import com.koreait.project.jungho.dao.TrainerClassDao;

public class TrainerClassListCommand implements CommonVoidCommand {

	@Override
	public void execute(SqlSession sqlSession, Model model) {
		
		TrainerClassDao trainerClassdao = sqlSession.getMapper(TrainerClassDao.class);
		model.addAttribute("MeetingDto", trainerClassdao.trainerClassList());
		
	}

}
