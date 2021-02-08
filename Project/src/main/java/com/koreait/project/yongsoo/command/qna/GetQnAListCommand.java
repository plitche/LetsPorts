package com.koreait.project.yongsoo.command.qna;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.ui.Model;

import com.koreait.project.common.CommonVoidCommand;
import com.koreait.project.yongsoo.dao.QnADao;
import com.koreait.project.yongsoo.dto.QnATemDto;

public class GetQnAListCommand implements CommonVoidCommand {

	@Override
	public void execute(SqlSession sqlSession, Model model) {

		QnADao qnaDao = sqlSession.getMapper(QnADao.class);
		List<QnATemDto> qnaList = qnaDao.getQnAList();
		model.addAttribute("qnaList", qnaList);
	}

}
