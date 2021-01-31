package com.koreait.project.yewon.command;

import org.apache.ibatis.session.SqlSession;
import org.springframework.ui.Model;

import com.koreait.project.common.CommonVoidCommand;
import com.koreait.project.yewon.dao.KnowHowDao;

public class GoknowHowListCommand implements CommonVoidCommand {
	
	@Override
	public void execute(SqlSession sqlSession, Model model) {
	
		KnowHowDao knowHowDao = sqlSession.getMapper(KnowHowDao.class);
		model.addAttribute("list", knowHowDao.knowHowList());
		
		
	}

}
