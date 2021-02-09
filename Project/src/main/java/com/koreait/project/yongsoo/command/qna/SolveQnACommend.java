package com.koreait.project.yongsoo.command.qna;

import java.util.HashMap;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;
import org.springframework.ui.Model;

import com.koreait.project.common.CommonMapCommand;
import com.koreait.project.yongsoo.dao.CommonQnADao;

public class SolveQnACommend implements CommonMapCommand {

	@Override
	public Map<String, Object> execute(SqlSession sqlSession, Model model) {

		Map<String, Object> map = model.asMap();
		int board_qna_no = (int)map.get("board_qna_no");
		
		CommonQnADao commonQnADao = sqlSession.getMapper(CommonQnADao.class);
		int solveResult = commonQnADao.solveQnA(board_qna_no);
		
		Map<String, Object> result = new HashMap<String, Object>();
		if (solveResult>0) {
			result.put("result", true);
		} else {
			result.put("result", false);
		}
		
		return result;
	}

}
