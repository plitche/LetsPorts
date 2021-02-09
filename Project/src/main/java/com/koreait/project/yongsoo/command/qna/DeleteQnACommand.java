package com.koreait.project.yongsoo.command.qna;

import java.util.Map;

import org.apache.ibatis.session.SqlSession;
import org.springframework.ui.Model;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.koreait.project.common.CommonVoidCommand;
import com.koreait.project.yongsoo.dao.CommonQnADao;

public class DeleteQnACommand implements CommonVoidCommand {

	@Override
	public void execute(SqlSession sqlSession, Model model) {

		Map<String, Object> map = model.asMap();
		RedirectAttributes rttr = (RedirectAttributes)map.get("rttr");
		int board_qna_no = (int)map.get("board_qna_no");
		
		CommonQnADao commonQnADao = sqlSession.getMapper(CommonQnADao.class);
		int deleteResult = commonQnADao.deleteQnAInfo(board_qna_no);
		
		if (deleteResult>0) {
			rttr.addFlashAttribute("deleteResult", true);
		} else {
			rttr.addFlashAttribute("deleteResult", false);
		}
	}

}
