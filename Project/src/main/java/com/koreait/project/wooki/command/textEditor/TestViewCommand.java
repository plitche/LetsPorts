package com.koreait.project.wooki.command.textEditor;

import org.apache.ibatis.session.SqlSession;
import org.springframework.ui.Model;

import com.koreait.project.common.CommonVoidCommand;
import com.koreait.project.wooki.dao.EditorDao;
import com.koreait.project.wooki.dto.TestBoardDto;

public class TestViewCommand implements CommonVoidCommand {

	@Override
	public void execute(SqlSession sqlSession, Model model) {
		int no = (int) model.asMap().get("no");
		TestBoardDto testBoardDto = sqlSession.getMapper(EditorDao.class).view(no);
		if(testBoardDto != null) {
			model.addAttribute("dto", testBoardDto);
		}
	}

}
