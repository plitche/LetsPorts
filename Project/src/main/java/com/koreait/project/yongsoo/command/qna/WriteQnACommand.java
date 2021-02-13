package com.koreait.project.yongsoo.command.qna;

import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.apache.ibatis.session.SqlSession;
import org.springframework.ui.Model;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.koreait.project.common.CommonVoidCommand;
import com.koreait.project.yongsoo.dao.CommonQnADao;

public class WriteQnACommand implements CommonVoidCommand {

	@Override
	public void execute(SqlSession sqlSession, Model model) {

		Map<String, Object> map = model.asMap();
		HttpServletRequest request = (HttpServletRequest)map.get("request");
		RedirectAttributes rttr = (RedirectAttributes)map.get("rttr");
		
		String board_qna_title = request.getParameter("board_qna_title");
		String board_qna_content = request.getParameter("content");
		int user_no = Integer.parseInt(request.getParameter("user_no"));
		int temp_no = Integer.parseInt(request.getParameter("temp_no"));
		
		CommonQnADao commonQnADao = sqlSession.getMapper(CommonQnADao.class);
		int writeQnAResult = commonQnADao.writeQnA(board_qna_title, board_qna_content, user_no);
		int lastQnANo = commonQnADao.lastQnANo(user_no);
		int updatePhotoTable = commonQnADao.updatePhotoTable(lastQnANo, temp_no);
		
		if (writeQnAResult>0 && updatePhotoTable>0) {
			rttr.addFlashAttribute("writeQnAResult", true);
		} else {
			rttr.addFlashAttribute("writeQnAResult", false);
		}
		
	}

}
