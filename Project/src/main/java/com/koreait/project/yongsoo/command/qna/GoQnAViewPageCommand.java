package com.koreait.project.yongsoo.command.qna;

import java.util.Map;

import org.apache.ibatis.session.SqlSession;
import org.springframework.ui.Model;

import com.koreait.project.common.CommonVoidCommand;
import com.koreait.project.yongsoo.dao.CommonQnADao;
import com.koreait.project.yongsoo.dto.QnATemDto;

public class GoQnAViewPageCommand implements CommonVoidCommand {

	@Override
	public void execute(SqlSession sqlSession, Model model) {

		Map<String, Object> map = model.asMap();
		int board_qna_no = (int)map.get("board_qna_no");
		
		CommonQnADao qnaDao = sqlSession.getMapper(CommonQnADao.class);
		QnATemDto qnaTemDto = qnaDao.getUpdateQnAInfo(board_qna_no);
		
		model.addAttribute("qnaTemDto", qnaTemDto);
		
	}

}
