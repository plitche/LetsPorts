package com.koreait.project.yongsoo.command.qna;

import java.util.Map;

import org.apache.ibatis.session.SqlSession;
import org.springframework.ui.Model;

import com.koreait.project.common.CommonVoidCommand;

public class GoQnAUpdatePageCommand implements CommonVoidCommand {

	@Override
	public void execute(SqlSession sqlSession, Model model) {

		Map<String, Object> map = model.asMap();
		int board_qna_no = (int)map.get("board_qna_no");
		
		
		
	}

}
