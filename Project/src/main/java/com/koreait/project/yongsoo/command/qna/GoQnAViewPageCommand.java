package com.koreait.project.yongsoo.command.qna;

import java.text.SimpleDateFormat;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.apache.ibatis.session.SqlSession;
import org.springframework.ui.Model;

import com.koreait.project.common.CommonVoidCommand;
import com.koreait.project.yongsoo.dao.CommonQnADao;
import com.koreait.project.yongsoo.dto.BoardQnATemDto;

public class GoQnAViewPageCommand implements CommonVoidCommand {

	@Override
	public void execute(SqlSession sqlSession, Model model) {

		Map<String, Object> map = model.asMap();
		HttpServletRequest request = (HttpServletRequest)map.get("request");
		int board_qna_no = Integer.parseInt(request.getParameter("board_qna_no"));
		
		CommonQnADao qnaDao = sqlSession.getMapper(CommonQnADao.class);
		BoardQnATemDto qnaTemDto = qnaDao.getUpdateQnAInfo(board_qna_no);
		
		SimpleDateFormat format = new SimpleDateFormat("yyyy-MM-dd(E) HH:mm");
		qnaTemDto.setCreated_at2(format.format(qnaTemDto.getCreated_at()));
		
		model.addAttribute("qnaTemDto", qnaTemDto);
		model.addAttribute("page", request.getParameter("page"));
		
	}

}
