package com.koreait.project.wooki.command.textEditor;

import org.apache.ibatis.session.SqlSession;
import org.springframework.ui.Model;

import com.koreait.project.common.CommonVoidCommand;
import com.koreait.project.wooki.dao.EditorDao;
import com.koreait.project.wooki.dto.TestBoardDto;

public class InsertBoardTestCommand implements CommonVoidCommand {

	@Override
	public void execute(SqlSession sqlSession, Model model) {
		TestBoardDto testBoardDto = (TestBoardDto) model.asMap().get("testBoardDto");
		if(sqlSession.getMapper(EditorDao.class).insertBoard(testBoardDto) > 0) {
			sqlSession.getMapper(EditorDao.class).updatePhoto(testBoardDto);
		};
		
	}

}
