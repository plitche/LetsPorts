package com.koreait.project.yongsoo.command;

import org.apache.ibatis.session.SqlSession;
import org.springframework.ui.Model;

import com.koreait.project.common.CommonVoidCommand;
import com.koreait.project.yongsoo.dao.TrainerDao;

public class GoTrainerListCommand implements CommonVoidCommand {

	@Override
	public void execute(SqlSession sqlSession, Model model) {

		TrainerDao trainerDao = sqlSession.getMapper(TrainerDao.class);
		model.addAttribute("trainerList", trainerDao.trainerList());
		
	}

}
