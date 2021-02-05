package com.koreait.project.jungho.command.TrainerClassCommand;

import org.apache.ibatis.session.SqlSession;
import org.springframework.ui.Model;

import com.koreait.project.common.CommonVoidCommand;
import com.koreait.project.jungho.dao.TrainerClassDao;

public class TrainerClassListCommand implements CommonVoidCommand {

	@Override
	public void execute(SqlSession sqlSession, Model model) {
		
		// 모든 클래스목록들을 뿌려주기 위한 작업
		TrainerClassDao trainerClassDao = sqlSession.getMapper(TrainerClassDao.class);
		model.addAttribute("MeetingList", trainerClassDao.trainerClassList());
		model.addAttribute("ClassTags", trainerClassDao.classTag());		
	}

}
