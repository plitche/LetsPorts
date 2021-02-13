package com.koreait.project.yongsoo.command.qna;

import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.apache.ibatis.session.SqlSession;
import org.springframework.ui.Model;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.koreait.project.common.CommonVoidCommand;
import com.koreait.project.dto.Board_qnaDto;
import com.koreait.project.yongsoo.dao.CommonQnADao;

public class UpdateQnACommand implements CommonVoidCommand {

	@Override
	public void execute(SqlSession sqlSession, Model model) {
		
		Map<String, Object> map = model.asMap();
		HttpServletRequest request = (HttpServletRequest)map.get("request");
		RedirectAttributes rttr = (RedirectAttributes)map.get("rttr");
		
		int board_qna_no = Integer.parseInt(request.getParameter("board_qna_no"));
		String board_qna_title = request.getParameter("board_qna_title");
		String board_qna_content = request.getParameter("content");
		int temp_no = Integer.parseInt(request.getParameter("temp_no"));

		Board_qnaDto board_qnaDto = new Board_qnaDto();
		board_qnaDto.setBoard_qna_no(board_qna_no);
		board_qnaDto.setBoard_qna_title(board_qna_title);
		board_qnaDto.setBoard_qna_content(board_qna_content);
		
		CommonQnADao commonQnADao = sqlSession.getMapper(CommonQnADao.class);
		int updateResult = commonQnADao.updateQnA(board_qnaDto);
		int updatePhotoTable = commonQnADao.updatePhotoTable(board_qna_no, temp_no);
		
		if (updateResult>0 && updatePhotoTable>0) {
			rttr.addFlashAttribute("updateResult", true);
		} else {
			rttr.addFlashAttribute("updateResult", false);
		}
	}

}
