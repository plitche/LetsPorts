package com.koreait.project.yewon.command;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.ui.Model;

import com.koreait.project.common.CommonVoidCommand;
import com.koreait.project.dto.Board_knowhowDto;
import com.koreait.project.yewon.dao.KnowHowDao;

public class GoKnowHowListCommand implements CommonVoidCommand {
	
	@Override
	public void execute(SqlSession sqlSession, Model model) {
		
		KnowHowDao knowHowDao = sqlSession.getMapper(KnowHowDao.class);
		List<Board_knowhowDto> list = knowHowDao.knowHowList();
		model.addAttribute("list", list);
		
		
	}
	


}
